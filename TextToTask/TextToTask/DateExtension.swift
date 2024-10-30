//
//  DateExtension.swift
//  TextToTask
//
//  Created by 森田健太 on 2024/10/30.
//


import SwiftUI
import Foundation


extension Date {
    func previousMonth() -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: -1, to: self) ?? self
    }

    func nextMonth() -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: 1, to: self) ?? self
    }

    func generateCurrentMonthCalendar() -> [[Date]] {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // 日曜日を週の始まりとする
        
        // 月の最初の日
        guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: self)) else {
            return []
        }
        
        // 月の日数を取得
        guard let range = calendar.range(of: .day, in: .month, for: startOfMonth) else {
            return []
        }
        
        // 月の日付をすべて取得
        var days: [Date] = []
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                days.append(date)
            }
        }
        
        // 月の最初の週の日曜日まで空白を追加
        if let firstDay = days.first {
            let weekday = calendar.component(.weekday, from: firstDay)
            let emptyDays = (weekday - calendar.firstWeekday + 7) % 7
            for _ in 0..<emptyDays {
                days.insert(Date.distantPast, at: 0) // 前に空白日を追加
            }
        }
        
        // 月末の週の残りを空白で埋める
        if let lastDay = days.last {
            let weekday = calendar.component(.weekday, from: lastDay)
            let emptyDays = (7 - ((weekday - calendar.firstWeekday + 7) % 7) - 1) % 7
            for _ in 0..<emptyDays {
                days.append(Date.distantFuture) // 後ろに空白日を追加
            }
        }
        
        // 週ごとに分割
        var weeks: [[Date]] = []
        while !days.isEmpty {
            let week = Array(days.prefix(7))
            weeks.append(week)
            days.removeFirst(min(7, days.count))
        }
        
        return weeks
    }

    func dayNumber() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        return self == Date.distantPast ? "" : "\(day)"
    }

    func monthYearFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月"
        return formatter.string(from: self)
    }
}
