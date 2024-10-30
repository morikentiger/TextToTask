//
//  TaskListView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/28.
//

// TaskListView.swift

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskManager: TaskManager

    var body: some View {
        // タスクをソート
        let sortedTasks = taskManager.tasks.sorted {
            $0.dueDate < $1.dueDate
        }

        // 過去のタスクと未来のタスクを分ける
        let pastTasks = sortedTasks.filter { $0.dueDate < Date() }
        let futureTasks = sortedTasks.filter { $0.dueDate >= Date() }

        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // 過去のタスク
                if !pastTasks.isEmpty {
                    Text("過去のタスク")
                        .font(.headline)
                        .padding(.top)
                        .padding(.leading)

                    ForEach(pastTasks.reversed()) { task in
                        TaskRow(task: task)
                            .environmentObject(taskManager)
                    }
                }

                // 未来のタスク
                if !futureTasks.isEmpty {
                    Text("今後のタスク")
                        .font(.headline)
                        .padding(.top)
                        .padding(.leading)

                    ForEach(futureTasks) { task in
                        TaskRow(task: task)
                            .environmentObject(taskManager)
                    }
                }
            }
        }
        .padding(.bottom)
    }
}
