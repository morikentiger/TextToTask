//
//  TaskManager.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/27.
//


import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(from input: String) {
        let lines = input.components(separatedBy: "\n")
        for line in lines {
            if let task = parseTask(from: line) {
                tasks.append(task)
            }
        }
    }
    
    private func parseTask(from text: String) -> Task? {
        let dateDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
        let matches = dateDetector?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        if let match = matches?.first, let date = match.date {
            let title = (text as NSString).replacingCharacters(in: match.range, with: "").trimmingCharacters(in: .whitespaces)
            return Task(title: title, dueDate: date)
        } else {
            // 日時が見つからない場合は現在日時を設定
            return Task(title: text, dueDate: Date())
        }
    }
}