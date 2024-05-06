//
//  HomeView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 5/3/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext)
    private var context
    
    @EnvironmentObject
    var authService: AuthService
    
    @Query(sort: \Todo.createdAt, animation: .smooth)
    private var todos: [Todo]
    
    @State
    var showingAddTodo = false
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geo in
                VStack{
                    Image(systemName: "trash").backgroundStyle(Color.red)
                        .frame(height: geo.size.height * (1/3))
                    ListView
                        .navigationTitle("Todo")
                        .toolbar {
                            ToolbarItem(placement:.navigationBarLeading)
                            {
                                Button("Log out") {
                                    print("Log out tapped!")
                                    authService.regularSignOut { error in
                                        
                                        if let e = error {
                                            print(e.localizedDescription)
                                        }
                                    }
                                }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                ActionBar
                            }
                        }
                        .sheet(isPresented: $showingAddTodo) {
                            AddTodoView()
                        }
                        .overlay {
                            if todos.isEmpty {
                                EmptyView
                            }
                        }
                        .frame(height: geo.size.height * (2/3))
                }
                
            }.tint(.orange)
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
                    .labelStyle(.titleAndIcon)
                    .font(.subheadline)
            }
            .buttonStyle(.bordered)
            .controlSize(.mini)
        }
    }
    
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
            context.delete(todo)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    HomeView()
}
