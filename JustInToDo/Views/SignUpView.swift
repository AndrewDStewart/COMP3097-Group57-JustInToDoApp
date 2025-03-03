//
//  Task.swift
//  JustInToDo
//
//  Created by Jam Furaque - Group 57
//  Student Number 101382608
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToAccepted = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Full Name", text: $fullName)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }

                Section(header: Text("Password")) {
                    SecureField("Password", text: $password)
                    SecureField("Confirm Password", text: $confirmPassword)
                }

                Section {
                    Button(action: signUp) {
                        Text("Sign Up")
                    }
                }
            }
            .navigationTitle("Create Account")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .background(
                NavigationLink(destination: SignUpAcceptedView(), isActive: $navigateToAccepted) {
                    EmptyView()
                }
            )
        }
    }

    private func signUp() {
        guard !fullName.isEmpty && !email.isEmpty && !password.isEmpty else {
            alertMessage = "Please fill in all fields"
            showAlert = true
            return
        }

        guard password == confirmPassword else {
            alertMessage = "Passwords do not match"
            showAlert = true
            return
        }

        if userViewModel.signUp(fullName: fullName, email: email, password: password) {
            navigateToAccepted = true
        } else {
            alertMessage = "Email already in use"
            showAlert = true
        }
    }
}



