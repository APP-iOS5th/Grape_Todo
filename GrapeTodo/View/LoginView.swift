//
//  LoginView.swift
//  GrapeTodo
//
//  Created by changhyen yun on 5/3/24.
//

import SwiftUI

struct LoginView: View {
    @State 
    private var email: String = ""
    
    @State
    private var password: String = ""
    
    @EnvironmentObject
    var authService: AuthService
    
    @Environment(\.dismiss)
    var dismiss
    
    var body: some View {
        VStack{
            TextField("Email", text: $email).textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password).textFieldStyle(.roundedBorder)
            Button("Login") {
                authService.regularSignIn(email: email, password: password) { error in
                    if let e = error {
                        print(e.localizedDescription)
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            Button("Create an Account") {
                authService.regularCreateAccount(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            Button {
                print("Tapped apple sign in")
                authService.startSignInWithAppleFlow()
            } label: {
                Image("AppleButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
            }
            Button {
                print("Tapped google sign in")
                authService.googleSignIn()
            } label: {
                Image("GoogleButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
            }
            
            
        }
    }
}

#Preview {
    LoginView()
}
