import SwiftUI
import Foundation

struct CalendarView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var currentDate = Date()

    private var weeks: [[Date]] {
        $currentDate.wrappedValue.generateCurrentMonthCalendar()
    }

    var body: some View {
        VStack {
            // 月の表示
            HStack {
                Button(action: {
                    $currentDate.wrappedValue = $currentDate.wrappedValue.previousMonth()
                }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(currentDate.monthYearFormat())
                    .font(.headline)
                Spacer()
                Button(action: {
                    currentDate = currentDate.nextMonth()
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            // 曜日の表示
            HStack(spacing: 0) {
                ForEach(0..<7) { index in
                    let day = ["日", "月", "火", "水", "木", "金", "土"][index]
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .foregroundColor(headerTextColor(for: index))
                }
            }
            
            // 日付の表示
            ForEach(weeks, id: \.self) { week in
                HStack(spacing: 0) {
                    ForEach(week, id: \.self) { date in
                        CalendarDateView(date: date, tasks: taskManager.tasks.filter {
                            Calendar.current.isDate($0.dueDate, inSameDayAs: date)
                        })
                    }
                }
            }
        }
    }
        // 曜日に応じたテキストカラーを返す関数
    func headerTextColor(for index: Int) -> Color {
        if index == 0 {
            // 日曜日
            return Color.red
        } else if index == 6 {
            // 土曜日
            return Color.blue
        } else {
            // 平日
            return Color.primary
        }
    }
}
