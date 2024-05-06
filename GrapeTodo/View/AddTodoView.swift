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
    private var modelContext
    
    @Environment(\.dismiss)
    var dismiss
    
    @EnvironmentObject
    var grapeViewModel: GrapeViewModel // EnvironmentObject 공유된 객체를 쓴다.
    
    @State
    private var todoName: String = ""
    
    @State
    private var todoDetail: String = ""
    
    @State
    private var todoColor = SelectColor.checked
    
    @State
    private var todoPriority: Priority = .routine
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        
                        TextField("할 일을 입력하세요.", text: $todoName)
                        ZStack(alignment: .leading) {
                            let placeHolder = "상세 내용을 입력하세요."
                            
                            TextEditor(text: $todoDetail)
                            
                            // 조건문으로 placeholder 표시해주기
                            if todoDetail.isEmpty {
                                Text(placeHolder)
                                    .foregroundColor(Color.primary.opacity(0.25))
                            }
                        }
                    }
                    Picker(selection: $todoPriority, label: Text("우선순위 선택")) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.description).tag(priority)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())     
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
            title: todoName,
            detail: todoDetail,
            color: todoColor,
            priority: todoPriority
        )
        grapeViewModel.addGrapes()
        modelContext.insert(newTodo)
        
        dismiss()
    }
}

#Preview {
    AddTodoView()
}
