//
//  AddView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.dismiss)
    var dismiss
    
    @State
    private var todoName: String = ""
    
    @State
    private var todoColor = SelectColor.checked
    
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
                        Text("Medium").tag(3)
                        Text("Low").tag(4)
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
            color: todoColor
        )
        context.insert(newTodo)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        dismiss()
    }
}

#Preview {
    AddTodoView()
}
