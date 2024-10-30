//
//  CalendarDateView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/28.
//

// CalendarDateView.swift

import SwiftUI

struct CalendarDateView: View {
    let date: Date
    let tasks: [Task]
    @State private var showTasks = false

    var body: some View {
        VStack {
            if date == Date.distantPast || date == Date.distantFuture {
                // 空白のセル
                Text("")
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
            } else {
                // 日付のセル
                Text(date.dayNumber())
                    .font(.body)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(
                        tasks.isEmpty ? Color.clear : Color.blue.opacity(0.3)
                    )
                    .clipShape(Circle())
                    .onTapGesture {
                        if !tasks.isEmpty {
                            showTasks.toggle()
                        }
                    }
                    .sheet(isPresented: $showTasks) {
                        TaskListView(tasks: tasks)
                    }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
