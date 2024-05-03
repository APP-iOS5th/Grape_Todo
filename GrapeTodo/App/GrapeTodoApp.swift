//
//  GrapeTodoApp.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI

@main
struct GrapeTodoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(grapeViewModel: GrapeViewModel())
        }
        .modelContainer(for: Todo.self)     // 모델을 연결하려고 씀
    }
}
