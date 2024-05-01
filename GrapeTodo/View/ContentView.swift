//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)
    private var context
    
    @Query(sort: \Todo.createdAt, animation: .smooth)
    private var todos: [Todo]
    
    @State
    var showingAddTodo = false
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geo in
                VStack(spacing: 0){
                    Rectangle()
                        .foregroundColor(Color(hex: "#D7DDDA"))
                        .frame(width: geo.size.width * (8/9), height: geo.size.height * (3/7))
                        .cornerRadius(25)
                    ListView
                        .navigationTitle("TODO")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                ActionBar
                            }
                        }
                        .sheet(isPresented: $showingAddTodo) {
                            AddTodoView()
                        }
                        .overlay {
                            if todos.isEmpty {
                                EmptyView.background()
                            }
                        }
                        .frame(height: geo.size.height * (1/2))
                }
                .background(Color(hex: "#F2F2F7"))
            }
        }
    }
    
    @ViewBuilder
    private var ListView: some View {
        List {
            ForEach(todos) { todo in
                TodoView(todo: todo)
            }
            .onDelete(perform: delete)
        }
    }
    
    @ViewBuilder
    private var ActionBar: some View {
        HStack {
            Spacer()
            Button {
                showingAddTodo = true
            } label: {
                Label("Add task", systemImage: "plus")
            }
            .buttonStyle(.borderless)
        }
    }
    
    @ViewBuilder
    private var EmptyView: some View {
        ContentUnavailableView {
            Text("할 일을 추가하세요.").font(.system(size:17))
                .fontWeight(.regular)
        }
        .background(Color(hex: "#F2F2F7"))
    }
    
    // MARK: Data operations
    private func delete(indices: IndexSet) {
        for index in indices {
            let todo = todos[index]
            context.delete(todo)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: user typed keyword
//    @State var searchKeyword: String = ""
//    @State private var isPresented = false
//
//    var results: [Todo] {
//        return searchKeyword.isEmpty ? todos : todos.filter({ todo in
//            todo.title.lowercased().contains(searchKeyword.lowercased())
//        })
//    }
//    var body: some View {
//        GeometryReader{ geo in
//
//            NavigationStack {
//                VStack{
//                    Image(systemName: "trash").backgroundStyle(Color.red)
//                        .frame(height: geo.size.height * (1/3))
//
//                    List {
//                        ForEach(results, id: \.self) { todo in
//                            NavigationLink(destination: TodoDetailView(todo: todo)) {
//                                HStack(alignment: .center) {
////                                    StatusIndicator(status: todo.status)
//                                    StatusIndicator(priority: todo.priority)
//                                    Spacer()
//                                    VStack(alignment: .leading) {
//                                        Text(todo.title)
//                                            .font(.title3)
//                                        Text(formatDate(todo.date))
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                    }
//                                }
//                            }
//                        }
//                    }
////                    .listStyle(.inset)
//
//                    // MARK: Add searchable modifier
//                    .searchable(text: $searchKeyword)
//                    .frame(height: geo.size.height * (2/3))
//                }
//                .navigationTitle("포도알 ToDo 만들기")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    Button {
//                        isPresented.toggle()
//                    } label: {
//                        Image(systemName: "plus")
//                            .font(.headline)
//                    }
//                }
//                .sheet(isPresented: $isPresented) {
//                    AddView()
//                }
//
//            }
//        }
//    }
//
//    private func formatDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .short
//        return formatter.string(from: date)
//    }
//}

#Preview {
    ContentView().modelContainer(for: Todo.self, inMemory: false)
}
