//
//  TodoView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment(\.modelContext) private var modelContext
    

    private var todo: Todo
    public init(todo: Todo) {
        self.todo = todo
    }
    
<<<<<<< Updated upstream
    private var todoColor: SelectColor {
        SelectColor(rawValue: todo.color) ?? .orange
    }
    
    @State
    var showingTodoDetail = false
    
=======
    @State var showingTodoDetail = false

>>>>>>> Stashed changes
    var body: some View {
        NavigationStack{
            HStack(){
                Button(action: toggleCompleted) {
                    Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(todoColor.representable)
                }.buttonStyle(.borderless)
                Text(todo.content)
                    .foregroundColor(todo.completed ? .secondary : .primary)
                Spacer()
                Button(action: {showingTodoDetail = true}) {
                    Image(systemName: "greaterthan")
                        .foregroundColor(todoColor.representable)
                }.buttonStyle(.plain).navigationDestination(isPresented:$showingTodoDetail) { TodoDetailView(todo: todo)}
            }
        }
    }

//    private func counter() -> Int {
//        var countComplete = 0
//        for todo in todos {
//            if todo.completed == true {
//                countComplete += 1
//            }
//        }
//        print(countComplete)
//        return countComplete
//    }

    private func toggleCompleted() {
        todo.completed.toggle()
//        do {
//            try context.save()  // 내부데이터에 상태변경 저장때문에 쓰인 save()
//        } catch {
//            print(error.localizedDescription)
//        }
    }
}

struct DameTodo {
    var content: String
    var color: SelectColor // 색상 추가

    init(content: String, color: SelectColor) {
        self.content = content
        self.color = color
    }
}


