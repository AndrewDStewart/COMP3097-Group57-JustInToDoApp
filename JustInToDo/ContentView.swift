//
//  Task.swift
//  JustInToDo
//
//  Created by Andrew Stewart - Group 57
//  Student Number 101418564
//
import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var taskViewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            if userViewModel.isAuthenticated {
                DashboardView()
            } else {
                WelcomeView()
            }
        }
        .environmentObject(userViewModel)
        .environmentObject(taskViewModel)
    }
}
