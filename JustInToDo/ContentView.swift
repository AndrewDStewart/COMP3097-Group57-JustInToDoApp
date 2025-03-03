//
//  ContentView.swift
//  JustInToDo
//
//  Created by Andrew Stewart on 2025-03-02.
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
