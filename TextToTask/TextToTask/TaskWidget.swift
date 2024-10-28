//
//  TaskWidgetEntryView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//


import WidgetKit
import SwiftUI

struct TaskWidgetEntryView : View {
    var body: some View {
        VStack {
            Text("タスクを追加")
                .font(.headline)
            Button(action: {
                // ウィジェットからアプリを開く
                if let url = URL(string: "myappscheme://add") {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("追加")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

//@main
struct TaskWidget: Widget {
    let kind: String = "TaskWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TaskWidgetEntryView()
        }
        .configurationDisplayName("タスクウィジェット")
        .description("ここからタスクを追加できます。")
        .supportedFamilies([.systemSmall])
    }
}
