//
//  UserViewModel.swift
//  JustInToDo
//
//  Created by Andrew Stewart on 2025-03-02.
//
import Foundation

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    @Published var users: [User] = []
    
    func login(email: String, password: String) -> Bool {
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            currentUser = user
            isAuthenticated = true
            return true
        }
        return false
    }
    
    func logout() {
        currentUser = nil
        isAuthenticated = false
    }
    
    func signUp(fullName: String, email: String, password: String) -> Bool {
        // Check if user already exists
        guard !users.contains(where: { $0.email == email }) else {
            return false
        }
        
        let newUser = User(fullName: fullName, email: email, password: password)
        users.append(newUser)
        // In a real app, you would save this to persistent storage
        return true
    }
}


