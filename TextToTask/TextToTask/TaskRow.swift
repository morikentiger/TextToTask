//
//  TaskRow.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/30.
//


import SwiftUI

struct TaskRow: View {
    let task: Task
    @EnvironmentObject var taskManager: TaskManager
    @State private var showDeleteAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.body)
                    HStack {
                        Text(task.dueDate, style: .date)
                        Text(task.dueDate, style: .time)
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    showDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                .alert(isPresented: $showDeleteAlert) {
                    Alert(
                        title: Text("本当に削除しますか？"),
                        message: Text("このタスクを削除すると元に戻せません。"),
                        primaryButton: .destructive(Text("はい")) {
                            deleteTask()
                        },
                        secondaryButton: .cancel(Text("いいえ"))
                    )
                }
            }
            Divider()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }

    private func deleteTask() {
        if let index = taskManager.tasks.firstIndex(where: { $0.id == task.id }) {
            taskManager.tasks.remove(at: index)
        }
    }
}
