//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart on 2025-03-02.
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


