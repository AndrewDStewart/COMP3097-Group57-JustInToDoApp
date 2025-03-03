//
//  AddTaskView.swift
//  JustInToDo
//
//  Created by Kei Ishikawa on 2025-03-02.
// Student ID 101426567
//
import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                
                Section {
                    Button(action: addTask) {
                        Text("Add Task")
                    }
                }
            }
            .navigationTitle("Add New Task")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func addTask() {
        taskViewModel.addTask(title: title, description: description, dueDate: dueDate)
        presentationMode.wrappedValue.dismiss()
    }
}


