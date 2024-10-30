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
                    .foregroundColor(textColor(for: date))
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
                        TaskListView()//tasks: tasks)
                    }
            }
        }
        .frame(maxWidth: .infinity)
    }

    // 曜日に応じたテキストカラーを返す関数
    func textColor(for date: Date) -> Color {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        if weekday == 1 {
            // 日曜日
            return Color.red
        } else if weekday == 7 {
            // 土曜日
            return Color.blue
        } else {
            // 平日
            return Color.primary
        }
    }
}
