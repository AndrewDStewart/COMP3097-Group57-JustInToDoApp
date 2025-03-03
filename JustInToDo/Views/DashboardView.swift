//
//  DashboardView.swift
//  JustInToDo
//
//  Created by Kei Ishikawa on 2025-03-02.
//
import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var showingAddTask = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, \(userViewModel.currentUser?.fullName ?? "User")!")
                    .font(.title)
                    .padding()
                
                List {
                    ForEach(taskViewModel.incompleteTasks) { task in
                        TaskRow(task: task)
                    }
                }
                
                HStack {
                    NavigationLink(destination: ViewAllTasksView()) {
                        Text("View All Tasks")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: { showingAddTask = true }) {
                        Text("Add Task")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Button(action: userViewModel.logout) {
                    Text("Logout")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .navigationTitle("Dashboard")
            .navigationBarItems(
                trailing: NavigationLink(destination: CompletedTaskView()) {
                    Image(systemName: "checkmark.circle")
                }
            )
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView()
        }
    }
}

struct TaskRow: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                taskViewModel.toggleTaskCompletion(taskId: task.id)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
        }
    }
}

