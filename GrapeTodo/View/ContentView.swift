//
//  ContentView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import SwiftData
import FirebaseAuth


struct ContentView: View {
  
    @EnvironmentObject
    var authService: AuthService

    var body: some View {
      
            if authService.signedIn {
                //            if false {
                HomeView()
            }else {
                LoginView()
            }
    }
}

#Preview {
    ContentView(grapeViewModel: GrapeViewModel())
        .modelContainer(for: Todo.self, inMemory: true)
}
