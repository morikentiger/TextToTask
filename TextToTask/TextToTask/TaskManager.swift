import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }

    init() {
        loadTasks()
    }

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
            // 日付を含むテキストの場合
            let title = (text as NSString).replacingCharacters(in: match.range, with: "").trimmingCharacters(in: .whitespaces)
            return Task(title: title, dueDate: date)
        } else {
            // 日付が見つからない場合は現在日時を設定
            return Task(title: text, dueDate: Date())
        }
    }

    // タスクをUserDefaultsに保存
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }

    // タスクをUserDefaultsから読み込み
    private func loadTasks() {
        if let savedTasksData = UserDefaults.standard.data(forKey: "tasks"),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedTasksData) {
            tasks = decodedTasks
        }
    }
}
