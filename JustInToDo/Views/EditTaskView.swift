//
//  EditTaskView.swift
//  JustInToDo
//
//  Created by Kei Ishikawa on 2025-03-02.
//
import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editedTask: Task
    
    init(task: Task) {
        _editedTask = State(initialValue: task)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Title", text: $editedTask.title)
                TextField("Description", text: $editedTask.description)
                DatePicker("Due Date", selection: $editedTask.dueDate, displayedComponents: .date)
                Toggle("Completed", isOn: $editedTask.isCompleted)
            }
            
            Section {
                Button(action: updateTask) {
                    Text("Update Task")
                }
            }
        }
        .navigationTitle("Edit Task")
    }
    
    private func updateTask() {
        taskViewModel.updateTask(task: editedTask)
        presentationMode.wrappedValue.dismiss()
    }
}


