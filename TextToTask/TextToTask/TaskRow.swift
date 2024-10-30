//
//  TaskRow.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/30.
//


import SwiftUI

struct TaskRow: View {
    let task: Task

    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.body)
                .padding(.bottom, 2)
            HStack {
                Text(task.dueDate, style: .date)
                Text(task.dueDate, style: .time)
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        Divider()
    }
}