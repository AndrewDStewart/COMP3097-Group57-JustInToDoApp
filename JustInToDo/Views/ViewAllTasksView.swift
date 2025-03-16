//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct ViewAllTasksView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var showingDeleteAlert = false
    @State private var taskToDelete: Task?
    
    var body: some View {
        ZStack {
            // Background
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                if taskViewModel.tasks.isEmpty {
                    // Empty state
                    VStack(spacing: 20) {
                        Image(systemName: "list.bullet.clipboard")
                            .font(.system(size: 60))
                            .foregroundColor(.customGreyLight)
                        
                        Text("No tasks yet")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.customTextPrimary)
                        
                        Text("Your tasks will appear here once you add them")
                            .font(.subheadline)
                            .foregroundColor(.customTextSecondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // Task list
                    List {
                        ForEach(taskViewModel.tasks) { task in
                            AllTasksRowView(task: task, onDelete: {
                                taskToDelete = task
                                showingDeleteAlert = true
                            })
                            .listRowBackground(Color.customBackground)
                            .listRowInsets(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .navigationBarTitle("All Tasks", displayMode: .inline)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("All Tasks")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.customTeal)
            }
        }
        .alert(isPresented: $showingDeleteAlert) {
            Alert(
                title: Text("Delete Task"),
                message: Text("Are you sure you want to delete this task?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let task = taskToDelete {
                        taskViewModel.deleteTask(taskId: task.id)
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct AllTasksRowView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let task: Task
    let onDelete: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 15) {
                // Checkbox
                Button(action: {
                    taskViewModel.toggleTaskCompletion(taskId: task.id)
                }) {
                    Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                        .font(.system(size: 22))
                        .foregroundColor(task.isCompleted ? .customTeal : .customGrey)
                }
                .padding(.top, 2)
                
                // Task details
                VStack(alignment: .leading, spacing: 5) {
                    Text(task.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.customTextPrimary)
                        .strikethrough(task.isCompleted)
                    
                    Text(task.description)
                        .font(.system(size: 14))
                        .foregroundColor(.customTextSecondary)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .font(.system(size: 12))
                            .foregroundColor(.customTeal)
                        
                        Text(formatDate(task.dueDate))
                            .font(.system(size: 12))
                            .foregroundColor(.customTeal)
                    }
                    .padding(.top, 5)
                }
                
                Spacer()
                
                // Action buttons
                HStack(spacing: 12) {
                    NavigationLink(destination: EditTaskView(task: task)) {
                        Image(systemName: "pencil")
                            .font(.system(size: 14))
                            .foregroundColor(.customGrey)
                            .padding(8)
                            .background(Color.customGreyLight.opacity(0.3))
                            .cornerRadius(8)
                    }
                    
                    Button(action: onDelete) {
                        Image(systemName: "trash")
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                            .padding(8)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
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

