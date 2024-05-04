//
//  GrapeTodoApp.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/29/24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct GrapeTodoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) 
    var delegate
    
    @StateObject 
    var authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authService)
        }
        .modelContainer(for: Todo.self)
    }
}
