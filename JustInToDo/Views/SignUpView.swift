//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
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
    @State private var isSigningUp = false
    
    var body: some View {
        ZStack {
            // Background color
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 25) {
                    // Header
                    VStack(spacing: 10) {
                        Text("Create Account")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.customTeal)
                        
                        Text("Sign up to get started")
                            .font(.subheadline)
                            .foregroundColor(.customTextSecondary)
                    }
                    .padding(.top, 30)
                    
                    // Sign up form
                    VStack(spacing: 20) {
                        // Full Name field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Full Name")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.customGrey)
                                
                                TextField("Enter your full name", text: $fullName)
                                    .foregroundColor(.customTextPrimary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.customGreyLight, lineWidth: 1)
                            )
                        }
                        
                        // Email field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.customGrey)
                                
                                TextField("Enter your email", text: $email)
                                    .autocapitalization(.none)
                                    .keyboardType(.emailAddress)
                                    .foregroundColor(.customTextPrimary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.customGreyLight, lineWidth: 1)
                            )
                        }
                        
                        // Password field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.customGrey)
                                
                                SecureField("Enter your password", text: $password)
                                    .foregroundColor(.customTextPrimary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.customGreyLight, lineWidth: 1)
                            )
                        }
                        
                        // Confirm Password field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Confirm Password")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.customGrey)
                                
                                SecureField("Confirm your password", text: $confirmPassword)
                                    .foregroundColor(.customTextPrimary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.customGreyLight, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // Sign up button
                    Button(action: signUp) {
                        if isSigningUp {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Create Account")
                                .fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customTeal)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: Color.customTeal.opacity(0.3), radius: 5, x: 0, y: 3)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    .disabled(isSigningUp)
                    
                    // Terms and conditions
                    Text("By signing up, you agree to our Terms of Service and Privacy Policy")
                        .font(.caption)
                        .foregroundColor(.customTextSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .padding(.top, 5)
                        .padding(.bottom, 30)
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .background(
            NavigationLink(destination: SignUpAcceptedView(), isActive: $navigateToAccepted) {
                EmptyView()
            }
        )
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
        
        isSigningUp = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if userViewModel.signUp(fullName: fullName, email: email, password: password) {
                isSigningUp = false
                navigateToAccepted = true
            } else {
                isSigningUp = false
                alertMessage = "Email already in use"
                showAlert = true
            }
        }
    }
}




