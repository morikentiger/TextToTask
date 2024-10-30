//
//  AddTaskView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//
// AddTaskView.swift

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var inputText: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            TextEditor(text: $inputText)
                .padding()
                .border(Color.gray)
                .navigationTitle("タスク追加")

            Button("追加") {
                taskManager.addTask(from: inputText)
                dismiss()
            }
            .padding()
        }
    }
}
