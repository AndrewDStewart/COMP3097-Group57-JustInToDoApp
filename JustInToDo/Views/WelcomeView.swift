//
//  Task.swift
//  JustInToDo
//
//  Created by Jam Furaque - Group 57
//  Student Number 101382608
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("Just-In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("To-Do App")
                    .font(.title)
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

