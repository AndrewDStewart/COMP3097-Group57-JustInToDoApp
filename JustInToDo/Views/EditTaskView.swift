//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editedTask: Task
    @State private var isUpdatingTask = false
    
    init(task: Task) {
        _editedTask = State(initialValue: task)
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.customBackground.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Form
                Form {
                    Section {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Task Title")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            TextField("Enter task title", text: $editedTask.title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.customGreyLight, lineWidth: 1)
                                )
                        }
                        .listRowBackground(Color.customBackground)
                        .padding(.vertical, 5)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            TextEditor(text: $editedTask.description)
                                .frame(minHeight: 100)
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.customGreyLight, lineWidth: 1)
                                )
                        }
                        .listRowBackground(Color.customBackground)
                        .padding(.vertical, 5)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Due Date")
                                .font(.headline)
                                .foregroundColor(.customTextSecondary)
                            
                            DatePicker("", selection: $editedTask.dueDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .accentColor(.customTeal)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.customGreyLight, lineWidth: 1)
                                )
                        }
                        .listRowBackground(Color.customBackground)
                        .padding(.vertical, 5)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Toggle(isOn: $editedTask.isCompleted) {
                                Text("Mark as Completed")
                                    .font(.headline)
                                    .foregroundColor(.customTextSecondary)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: .customTeal))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.customGreyLight, lineWidth: 1)
                            )
                        }
                        .listRowBackground(Color.customBackground)
                        .padding(.vertical, 5)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
                .listStyle(InsetGroupedListStyle())
                .background(Color.customBackground)
                
                // Update button
                Button(action: updateTask) {
                    if isUpdatingTask {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Update Task")
                            .fontWeight(.bold)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customTeal)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(color: Color.customTeal.opacity(0.3), radius: 5, x: 0, y: 3)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .disabled(isUpdatingTask || editedTask.title.isEmpty)
                .opacity(editedTask.title.isEmpty ? 0.7 : 1)
            }
        }
        .navigationBarTitle("Edit Task", displayMode: .inline)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Edit Task")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.customTeal)
            }
        }
    }
    
    private func updateTask() {
        guard !editedTask.title.isEmpty else { return }
        
        isUpdatingTask = true
        
        // Simulate a brief delay for better UX
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            taskViewModel.updateTask(task: editedTask)
            isUpdatingTask = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}


