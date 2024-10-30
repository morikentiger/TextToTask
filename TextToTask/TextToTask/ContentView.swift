//
//  ContentView.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//
import SwiftUI
import Foundation

struct ContentView: View {
    @EnvironmentObject var taskManager: TaskManager

    var body: some View {
        NavigationView {
            VStack {
                CalendarView()
                    .environmentObject(taskManager)
                Spacer()
            }
            .navigationTitle("カレンダー")
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
