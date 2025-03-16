//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct SignUpAcceptedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Background color
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Spacer()
                
                // Success icon
                ZStack {
                    Circle()
                        .fill(Color.customTealLight.opacity(0.3))
                        .frame(width: 150, height: 150)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.customTeal)
                        .shadow(color: .customTeal.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                
                // Success message
                VStack(spacing: 15) {
                    Text("Registration Successful!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.customTextPrimary)
                    
                    Text("Your account has been created successfully.")
                        .font(.headline)
                        .foregroundColor(.customTextSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                
                // Return to login button
                Button(action: {
                    // Dismiss this view and the SignUpView to return to the login screen
                    presentationMode.wrappedValue.dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Return to Login")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.customTeal)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.customTeal.opacity(0.3), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
            }
        }
        .navigationBarHidden(true)
    }
}

