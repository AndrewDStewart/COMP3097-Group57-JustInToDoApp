//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var isLoggingIn = false
    
    var body: some View {
        ZStack {
            // Background color
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                // Header
                VStack(spacing: 10) {
                    Text("Welcome Back!")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.customTeal)
                    
                    Text("Login to continue")
                        .font(.subheadline)
                        .foregroundColor(.customTextSecondary)
                }
                .padding(.top, 50)
                
                Spacer()
                
                // Login form
                VStack(spacing: 20) {
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
                    
                    // Forgot password link
                    HStack {
                        Spacer()
                        Button(action: {
                            // Handle forgot password
                        }) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.customTeal)
                        }
                    }
                    .padding(.top, -5)
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                // Login button
                Button(action: login) {
                    if isLoggingIn {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Login")
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
                .disabled(isLoggingIn)
                
                // Sign up link
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.customTextSecondary)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.customTeal)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login Failed"), message: Text("Please check your credentials and try again."), dismissButton: .default(Text("OK")))
        }
    }
    
    private func login() {
        isLoggingIn = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if userViewModel.login(email: email, password: password) {
                // Login successful
                isLoggingIn = false
            } else {
                isLoggingIn = false
                showAlert = true
            }
        }
    }
}



