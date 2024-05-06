//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Todo.createdAt, animation: .smooth) private var todos: [Todo]

    @StateObject var grapeViewModel = GrapeViewModel()

    @State var showingAddTodo = false
    @State private var date = Date()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()

    var body: some View {
        TabView {
            NavigationStack {
                GeometryReader{ geometry in
                    VStack(spacing: 0){

                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(hex: "#D7DDDA"))
                                .frame(width: geometry.size.width * (8/9), height: geometry.size.height * (3/7))
                                .cornerRadius(25)

                            GrapeView()
                                .environmentObject(grapeViewModel)

                            GeometryReader { geometry in
                                Text("\(date, formatter: dateFormatter)")
                                    .frame(width: geometry.size.width * 0.47, height: geometry.size.height * 0.33)
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color.black)

                                GrapesForCompletedTodos(completedCount: grapeViewModel.completedCount, geometry: geometry)

                            }
                        }.background(Color(hex: "#F2F2F7"))

                        ListView
                            .onAppear {
                                grapeViewModel.completedCount = counter()
                            }
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
                                    EmptyView.background()
                                }
                            }
                    }

                }
            }
            .tabItem {
                Image(systemName: "checkmark.circle")
                Text("TODO")
            }
            AchievementView()
            .tabItem {
                Image(systemName: "calendar.badge.checkmark").foregroundColor(.black)
                Text("Achivement")
            }
        }.accentColor(Color.green)
    }

    @ViewBuilder
    private var ListView: some View {
        List {
            ForEach(todos) { todo in
                TodoView(todo: todo)
                    .environmentObject(grapeViewModel)
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
            .foregroundColor(.green)
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

    private func counter() -> Int {
        var countComplete = 0
        for todo in todos {
            if todo.completed == true {
                countComplete += 1
            }
        }
        print("countComplete: \(countComplete)")
        return countComplete
    }

    // MARK: Data operations
    private func delete(indices: IndexSet) {
        for index in indices {
            let todo = todos[index]
            if todo.completed {
                grapeViewModel.completedCount -= 1
            }
            if todos.count < 16 {
                grapeViewModel.deleteGrapes()
            }
            modelContext.delete(todo)
        }
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
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 31 && completedCount <= 45 {
                Image("podoal31+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 46 && completedCount <= 60 {
                Image("podoal46+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else if completedCount >= 61 {
                Image("podoal61+")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60.0, height: 40.0, alignment: .trailing)
                    .frame(width: geometry.size.width * 1.65, height: geometry.size.height * 0.3)
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView(grapeViewModel: GrapeViewModel())
        .modelContainer(for: Todo.self, inMemory: false)
}
