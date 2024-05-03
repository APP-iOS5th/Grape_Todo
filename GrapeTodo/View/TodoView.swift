//
//  TodoView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct TodoView: View {
//    @Environment(\.modelContext) private var modelContext
    @State var showingTodoDetail = false
    @EnvironmentObject var grapeViewModel: GrapeViewModel

    private var todo: Todo
    public init(todo: Todo) {
        self.todo = todo
    }

    //    private var todoColor: SelectColor {
    //        SelectColor(rawValue: todo.color) ?? .orange
    //    }

    var body: some View {
        NavigationStack{
            HStack(){
                Button(action: toggleCompleted) {
                    Circle()
                        .fill(todo.completed ? Color(hex: "#BAF7AD") : Color(hex: "#F4F4F4"))
                        .frame(width : 20)
                }.buttonStyle(.borderless)
                Text(todo.content)
                    .foregroundColor(todo.completed ? .secondary : .primary)
//                Text("컴플리트 값: \(todo.completed)")
//                Text("카운트 값: \(grapeViewModel.completedCount)")

                Spacer()
                Text("\(todo.priority)")
                Spacer()
                Button(action: {showingTodoDetail = true}) {
                    //                    Text(todo.priotity?)
                    Image(systemName: "chevron.right")
                }.buttonStyle(.plain).navigationDestination(isPresented:$showingTodoDetail) { TodoDetailView(todo: todo)}

            }
        }
        .onAppear() {

        }

        
    }

        

    private func toggleCompleted() {
        todo.completed.toggle()
        if todo.completed {
            grapeViewModel.completedCount += 1
        } else {
            grapeViewModel.completedCount -= 1
        }
    }
}

//struct DameTodo {
//    var content: String
//    var color: SelectColor // 색상 추가
//
//    init(content: String, color: SelectColor) {
//        self.content = content
//        self.color = color
//    }
//}


