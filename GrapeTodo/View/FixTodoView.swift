//
//  FixTodoView.swift
//  GrapeTodo
//
//  Created by John Yun on 5/2/24.
//

import SwiftUI
import SwiftData

struct FixTodoView: View {
    @Binding var todo: Todo
    
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.dismiss)
    var dismiss
    
    @State
    private var todoName: String
    
    //    @State
    //    private var todoColor: SelectColor
    
    init(todo: Binding<Todo>) {
        self._todo = todo
        self._todoName = State(initialValue: todo.wrappedValue.content)
        //        self._todoColor = State(initialValue: SelectColor(rawValue: todo.wrappedValue.color) ?? .red)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("", text: $todoName)
                    }
                }
            }
            .navigationTitle("Todo")
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
        }
    }
    
    private func save() {
        guard !todoName.isEmpty else { return }
        
        // Update the todo object with the new values
        todo.content = todoName
        //        todo.color = todoColor.rawValue
        
        // Save the changes to CoreData
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        dismiss()
    }
}
