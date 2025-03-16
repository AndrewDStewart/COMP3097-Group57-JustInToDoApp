//
//  Task.swift
//  JustInToDo
//
//  Created by Jam Furaque - Group 57
//  Student Number 101382608
//
import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var isAddingTask = false
    
    var body: some View {
        NavigationView {
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
                                
                                TextField("Enter task title", text: $title)
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
                                
                                TextEditor(text: $description)
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
                                
                                DatePicker("", selection: $dueDate, displayedComponents: .date)
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
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                    .listStyle(InsetGroupedListStyle())
                    .background(Color.customBackground)
                    
                    // Add button
                    Button(action: addTask) {
                        if isAddingTask {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Add Task")
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
                    .disabled(isAddingTask || title.isEmpty)
                    .opacity(title.isEmpty ? 0.7 : 1)
                }
            }
            .navigationBarTitle("Add New Task", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Add New Task")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.customTeal)
                }
            }
        }
    }
    
    private func addTask() {
        guard !title.isEmpty else { return }
        
        isAddingTask = true
        
        // Simulate a brief delay for better UX
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            taskViewModel.addTask(title: title, description: description, dueDate: dueDate)
            isAddingTask = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}

