//
//  Task.swift
//  JustInToDo
//
//  Created by Jam Furaque - Group 57
//  Student Number 101382608
//
import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var showingAddTask = false
    
    var body: some View {
        ZStack {
            // Background
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 5) {
                    Text("Welcome, \(userViewModel.currentUser?.fullName ?? "User")")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.customTextPrimary)
                    
                    Text("Here are your tasks for today")
                        .font(.subheadline)
                        .foregroundColor(.customTextSecondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                // Task List Section
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Daily Tasks")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.customTextPrimary)
                        
                        Spacer()
                        
                        // Action buttons
                        HStack(spacing: 15) {
                            NavigationLink(destination: CompletedTaskView()) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.customTeal)
                                    .font(.system(size: 20))
                            }
                            
                            NavigationLink(destination: ViewAllTasksView()) {
                                Image(systemName: "eye")
                                    .foregroundColor(.customTeal)
                                    .font(.system(size: 20))
                            }
                            
                            Button(action: { showingAddTask = true }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.customTeal)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    if taskViewModel.incompleteTasks.isEmpty {
                        VStack(spacing: 20) {
                            Image(systemName: "list.bullet.clipboard")
                                .font(.system(size: 50))
                                .foregroundColor(.customGreyLight)
                            
                            Text("No tasks yet")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            Text("Tap the + button to add a new task")
                                .font(.subheadline)
                                .foregroundColor(.customGrey)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 50)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(taskViewModel.incompleteTasks) { task in
                                    TaskCardView(task: task)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Bottom Action Bar
                HStack(spacing: 15) {
                    Button(action: { showingAddTask = true }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Task")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.customTeal)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.customTeal.opacity(0.3), radius: 3, x: 0, y: 2)
                    }
                    
                    Button(action: userViewModel.logout) {
                        HStack {
                            Image(systemName: "arrow.right.square")
                            Text("Logout")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .foregroundColor(.customTeal)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.customTeal, lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showingAddTask) {
            AddTaskView()
        }
    }
}

struct TaskCardView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let task: Task
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            // Checkbox
            Button(action: {
                taskViewModel.toggleTaskCompletion(taskId: task.id)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
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
            
            // Edit button
            NavigationLink(destination: EditTaskView(task: task)) {
                Image(systemName: "pencil")
                    .font(.system(size: 14))
                    .foregroundColor(.customGrey)
                    .padding(8)
                    .background(Color.customGreyLight.opacity(0.3))
                    .cornerRadius(8)
            }
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


