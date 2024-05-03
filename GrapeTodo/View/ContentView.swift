//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {

    // SwiftData는 UI의 상태 변경 시 또는 특정 기간이 지난 후 컨텍스트를 스토어에 자동 저장한다. 하지만 원한다면 save()를 자유롭게 호출할 수 있다.
    @Environment(\.modelContext) private var modelContext // modelContext 객체를 이용하면 swiftData에서 제공하는 삽입,수정, 삭제 기능을 사용할 수 있음.
    @Query(sort: \Todo.createdAt, animation: .smooth) private var todos: [Todo]

    @StateObject var grapeViewModel: GrapeViewModel
    @State var showingAddTodo = false
    @State var completedCount : Int = 31
    @State private var date = Date()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()

    var body: some View {
//        GrapeView(grapeViewModel: GrapeViewModel()).environmentObject(grapeViewModel)
        NavigationStack {

            GeometryReader{ geometry in
                VStack(spacing: 0){

                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(hex: "#D7DDDA"))
                            .frame(width: geometry.size.width * (8/9), height: geometry.size.height * (3/7))
                            .cornerRadius(25)

                        // 여기다 포도알 그려주면 됨, 임시 포도알 생성(위치확인용)

                        GrapeView().environmentObject(grapeViewModel)


                        GeometryReader { geometry in
                            Text("\(date, formatter: dateFormatter)")
                                .frame(width: geometry.size.width * 0.47, height: geometry.size.height * 0.33)
                                .font(.system(size: 20))
                                .foregroundStyle(Color.black)

                            //                            GrapesForCompletedTodos(completedCount: completedCount, geometry: geometry)
                        }
                    }

                    ListView
                        .navigationTitle("Todo")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                ActionBar
                            }
                        }
                        .sheet(isPresented: $showingAddTodo) {
                            AddTodoView()
                                .environmentObject(grapeViewModel)
                        }
                        .overlay {
                            if todos.isEmpty {
                                EmptyView.background(Color.red)
                            }
                        }
                        .frame(height: geometry.size.height * (1/2))

                }

            }.tint(.orange)
        }
    }  // GeometryReader 괄호

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
                    .labelStyle(.titleAndIcon)
                    .font(.subheadline)
            }
            .buttonStyle(.bordered)
            .controlSize(.mini)
        }
    }

    // Todo 목록이 하나도 없을때 해당 View가 나옴
    @ViewBuilder
    private var EmptyView: some View {
        ContentUnavailableView {
            Label("아직 할일이 없으시네요", systemImage: "text.badge.plus")
        } description: {
            Text("새 할일을 추가 하시면 할일들 보여질 거에요 ")
        }
    }

    // MARK: Data operations
    private func delete(indices: IndexSet) {
        for index in indices {
            let todo = todos[index]
            modelContext.delete(todo)
        }

        //        do {
        //            try modelContext.save()
        //        } catch {
        //            print(error.localizedDescription)
        //        }
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
    ContentView(grapeViewModel: GrapeViewModel())
        .modelContainer(for: Todo.self, inMemory: false)
}

