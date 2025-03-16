//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct CompletedTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        ZStack {
            // Background
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                if taskViewModel.completedTasks.isEmpty {
                    // Empty state
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 60))
                            .foregroundColor(.customGreyLight)
                        
                        Text("No completed tasks")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.customTextPrimary)
                        
                        Text("Tasks you complete will appear here")
                            .font(.subheadline)
                            .foregroundColor(.customTextSecondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // Completed task list
                    List {
                        ForEach(taskViewModel.completedTasks) { task in
                            CompletedTaskRowView(task: task)
                                .listRowBackground(Color.customBackground)
                                .listRowInsets(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .navigationBarTitle("Completed Tasks", displayMode: .inline)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Completed Tasks")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.customTeal)
            }
        }
    }
}

struct CompletedTaskRowView: View {
    let task: Task
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 15) {
                // Checkmark
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.customTeal)
                    .padding(.top, 2)
                
                // Task details
                VStack(alignment: .leading, spacing: 5) {
                    Text(task.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.customTextPrimary)
                        .strikethrough(true)
                    
                    Text(task.description)
                        .font(.system(size: 14))
                        .foregroundColor(.customTextSecondary)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .font(.system(size: 12))
                            .foregroundColor(.customTeal)
                        
                        Text("Due: \(formatDate(task.dueDate))")
                            .font(.system(size: 12))
                            .foregroundColor(.customTeal)
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12))
                            .foregroundColor(.green)
                        
                        Text("Completed")
                            .font(.system(size: 12))
                            .foregroundColor(.green)
                    }
                }
                
                Spacer()
            }
            .padding(15)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
        }
        .padding(.vertical, 5)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

