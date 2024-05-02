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
    
    @State
    var completedCount : Int = 100
    
    var body: some View {
        NavigationStack {
            
            GeometryReader{ a in
                VStack(spacing: 0){
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(hex: "#D7DDDA"))
                            .frame(width: a.size.width * (8/9), height: a.size.height * (3/7))
                            .cornerRadius(25)
                        
                        GeometryReader { geometry in
                            GrapesForCompletedTodos(completedCount: completedCount, geometry: geometry)
                        }
//                        GeometryReader { geometry in
//                            Image("podoal16+")
//                                .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
//                        }
                    }
                    
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
                        .frame(height: a.size.height * (1/2))
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
    
    private func counter() -> Int {
        var countComplete = 0
        for todo in todos {
            if todo.completed == true {
                countComplete += 1
            }
        }
        print(countComplete)
        return countComplete
    }
    
}

struct GrapesForCompletedTodos: View {
    var completedCount : Int
    var geometry: GeometryProxy
    
    init(completedCount: Int, geometry: GeometryProxy) {
            self.completedCount = completedCount
            self.geometry = geometry
        }
    
    var body: some View {
        GeometryReader { geometry in
            if completedCount >= 16 && completedCount <= 30 {
                Image("podoal16+")
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 31 && completedCount <= 45 {
                Image("podoal31+")
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 46 && completedCount <= 60 {
                Image("podoal46+")
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 61 {
                Image("podoal61+")
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else {
                EmptyView()
            }
        }
    }
}
    
    #Preview {
        ContentView().modelContainer(for: Todo.self, inMemory: false)
    }
