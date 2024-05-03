//
//  TodoView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment(\.modelContext)
    private var context
    
    @State private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
//    private var todoColor: SelectColor {
//        SelectColor(rawValue: todo.color) ?? .orange
//    }
    
    @State
    var showingFixTodo = false
    
    var body: some View {
        NavigationStack{
            HStack(){
                Button(action: toggleCompleted) {
                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
//                        .foregroundColor(todoColor.representable)
                }.buttonStyle(.borderless)
                Text(todo.content)
                    .foregroundColor(todo.completed ? .secondary : .primary)
                Spacer()
                // todo 내용을 수정하는 화면으로 이동하게끔 경로 변경
                Button(action: {showingFixTodo = true}) {
                    Image(systemName: "greaterthan")
//                        .foregroundColor(todoColor.representable)
                }.buttonStyle(.plain).sheet(isPresented:$showingFixTodo) { FixTodoView(todo: $todo)}
            }
        }
    }
    
    private func toggleCompleted() {
        todo.completed.toggle()
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
