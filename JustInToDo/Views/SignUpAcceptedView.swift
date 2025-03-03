//
//  SignUpAcceptedView.swift
//  JustInToDo
//
//  Created by Andrew Stewart on 2025-03-02.
//
import SwiftUI

struct SignUpAcceptedView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.green)

            Text("Registration Successful!")
                .font(.title)
                .fontWeight(.bold)

            Text("Your account has been created successfully.")
                .multilineTextAlignment(.center)
                .padding()

            Button(action: {
                // Dismiss this view and the SignUpView to return to the login screen
                presentationMode.wrappedValue.dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Return to Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

