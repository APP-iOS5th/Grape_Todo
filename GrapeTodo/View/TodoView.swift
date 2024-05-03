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

    //    private var todoColor: SelectColor {
    //        SelectColor(rawValue: todo.color) ?? .orange
    //    }

    @State var showingTodoDetail = false

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
                Spacer()
                Button(action: {showingTodoDetail = true}) {
                    //                    Text(todo.priotity?)
                    Image(systemName: "chevron.right")
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


