//
//  LoginView.swift
//  JustInToDo
//
//  Created by Andrew Stewart on 2025-03-02.
//
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                if userViewModel.login(email: email, password: password) {
                    // Login successful, navigation will be handled by ContentView
                } else {
                    showAlert = true
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login Failed"), message: Text("Please check your credentials and try again."), dismissButton: .default(Text("OK")))
        }
    }
}


