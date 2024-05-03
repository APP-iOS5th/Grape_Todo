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

                        TextField("할 일을 입력하세요.", text: $todoName)
                    }
                    Picker(selection: $priority, label: Text("중요도")) {
                        Text("Routine").tag(1)
                        Text("High").tag(2)
                        Text("Low").tag(3)
                    }.pickerStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Picker Style@*/DefaultPickerStyle()/*@END_MENU_TOKEN@*/)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        save()
                    } label: {
                        Text("Save")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }

    private func save() {
        guard todoName.isEmpty == false else { return }

        let newTodo = Todo(
            content: todoName,
            color: todoColor,
            priority: priority
        )
        grapeViewModel.addGrapes()
        modelContext.insert(newTodo)

        dismiss()
    }
}

#Preview {
    AddTodoView()
}
