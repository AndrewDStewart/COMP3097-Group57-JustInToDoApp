//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var dueDate: Date
    var isCompleted: Bool
    
    init(title: String, description: String, dueDate: Date, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}


