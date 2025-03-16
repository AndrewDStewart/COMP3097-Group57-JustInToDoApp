//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let fullName: String
    let email: String
    let password: String
    
    init(fullName: String, email: String, password: String) {
        self.id = UUID()
        self.fullName = fullName
        self.email = email
        self.password = password
    }
}


