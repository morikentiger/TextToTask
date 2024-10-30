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
            HStack {
                ForEach(["日", "月", "火", "水", "木", "金", "土"], id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
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
}
