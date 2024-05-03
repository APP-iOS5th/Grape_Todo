//
//  AddView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var grapeViewModel: GrapeViewModel // EnvironmentObject 공유된 객체를 쓴다.
    @State private var todoName: String = ""
    @State private var todoColor = SelectColor.checked
    @State private var priority = 0
   

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("할일 내용 적기", text: $todoName)
//                        PriorityColorPicker(selectedColor: $todoColor)
                    }
                }
            }
            .navigationTitle("새로운 Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        save()
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.mini)
                }
            }
            .tint(.orange)
        }
    }

    private func save() {
        guard todoName.isEmpty == false else { return }

        let newTodo = Todo(
            content: todoName,
            color: todoColor
        )
        grapeViewModel.addGrapes()
        modelContext.insert(newTodo)

        dismiss()
    }
}

#Preview {
    AddTodoView()
}
