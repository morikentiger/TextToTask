//
//  TextToTaskApp.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//

import SwiftUI

@main
struct YourAppNameApp: App {
    @StateObject var taskManager = TaskManager()
    @State private var showAddTaskView = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskManager)
                .sheet(isPresented: $showAddTaskView) {
                    AddTaskView()
                        .environmentObject(taskManager)
                }
                .onOpenURL { url in
                    if url.scheme == "myappscheme", url.host == "add" {
                        showAddTaskView = true
                    }
                }
        }
    }
}
