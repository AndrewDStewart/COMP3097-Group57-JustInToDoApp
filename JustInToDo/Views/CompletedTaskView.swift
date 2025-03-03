//
//  CompletedTaskView.swift
//  JustInToDo
//
//  Created by Andrew Stewart on 2025-03-02.
//
import SwiftUI

struct CompletedTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        List {
            ForEach(taskViewModel.completedTasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                        .strikethrough()
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Completed on: \(formatDate(task.dueDate))")
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
        }
        .navigationTitle("Completed Tasks")
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


