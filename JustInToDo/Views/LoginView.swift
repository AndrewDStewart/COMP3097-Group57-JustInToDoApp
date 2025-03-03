//
//  Task.swift
//  JustInToDo
//
//  Created by Jam Furaque - Group 57
//  Student Number 101382608
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
            
            Button("Login") {                                                   // This is the button for logging in
                if userViewModel.login(email: email, password: password) {      // if logged in, cotentView will handle the navigation afterwards
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


