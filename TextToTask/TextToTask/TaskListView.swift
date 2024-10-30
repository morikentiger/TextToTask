//
//  TaskListView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/28.
//

// TaskListView.swift

import SwiftUI

struct TaskListView: View {
    let tasks: [Task]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List(tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                    Text(task.dueDate, style: .time)
                }
            }
            .navigationTitle("タスク一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("閉じる") {
                        dismiss()
                    }
                }
            }
        }
    }
}
