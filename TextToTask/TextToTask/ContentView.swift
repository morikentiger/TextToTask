//
//  ContentView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var taskManager: TaskManager

    var body: some View {
        NavigationView {
            List(taskManager.tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                    Text(task.dueDate, style: .date)
                    Text(task.dueDate, style: .time)
                }
            }
            .navigationTitle("タスク一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddTaskView().environmentObject(taskManager)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
