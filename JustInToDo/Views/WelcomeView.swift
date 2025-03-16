//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            // Background
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Spacer()
                
                // App logo and title
                VStack(spacing: 15) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.customTeal)
                        .shadow(color: .customTeal.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("Just-In")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.customTeal)
                    
                    Text("To-Do App")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(.customTextSecondary)
                }
                .padding(.bottom, 40)
                
                // Description
                Text("Manage your tasks efficiently and stay organized")
                    .font(.headline)
                    .foregroundColor(.customTextSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 40)
                
                Spacer()
                
                // Action buttons
                VStack(spacing: 16) {
                    NavigationLink(destination: LoginView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                            Text("Login")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.customTeal)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.customTeal.opacity(0.3), radius: 5, x: 0, y: 3)
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        HStack {
                            Image(systemName: "person.badge.plus")
                                .foregroundColor(.customTeal)
                            Text("Create Account")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.customTeal)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.customTeal, lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
            }
        }
        .navigationBarHidden(true)
    }
}





