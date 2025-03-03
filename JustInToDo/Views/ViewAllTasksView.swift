//
//  Task.swift
//  JustInToDo
//
//  Created by Jam Furaque - Group 57
//  Student Number 101382608
//
import SwiftUI

struct ViewAllTasksView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        List {
            ForEach(taskViewModel.tasks) { task in
                NavigationLink(destination: EditTaskView(task: task)) {
                    TaskRow(task: task)
                }
            }
            .onDelete(perform: deleteTask)
        }
        .navigationTitle("All Tasks")
        .navigationBarItems(trailing: EditButton())
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = taskViewModel.tasks[index]
            taskViewModel.deleteTask(taskId: task.id)
        }
    }
}


