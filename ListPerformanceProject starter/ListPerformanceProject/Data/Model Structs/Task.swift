//
//  Task.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import Foundation
import Observation

@Observable class Task: Identifiable {
    let id: UUID
    var title: String
    var category: Category
    var isDone: Bool
    let creationDate: Date
    
    init(title: String, 
         category: Category,
         creationDate: Date = Date(),
         isDone: Bool = false) {
        self.id = UUID()
        self.title = title
        self.category = category
        self.isDone = false
        self.creationDate = creationDate
    }
}

extension Task: Hashable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Task {
    
    static func example() -> Task {
        Task(title: "Grocery shopping", category: .shopping)
    }
    
   static func examples() -> [Task] {
        [Task(title: "Grocery shopping", category: .shopping),
         Task(title: "Email to manager", category: .work),
         Task(title: "Plan weekend trip", category: .personal),
         Task(title: "Weekly report", category: .work),
         Task(title: "Buy birthday gift", category: .shopping),
         Task(title: "Renew car insurance", category: .personal),
         Task(title: "Team meeting at 10 AM", category: .work),
         Task(title: "Yoga class subscription", category: .personal),
         Task(title: "Book dentist appointment", category: .personal),
         Task(title: "Prepare project proposal", category: .work),
         Task(title: "Order new headphones", category: .shopping),
         Task(title: "Study for certification exam", category: .personal),
         Task(title: "Client feedback call", category: .work),
         Task(title: "Pick up dry cleaning", category: .personal),
         Task(title: "Finalize holiday plans", category: .personal),
         Task(title: "Schedule home repairs", category: .personal),
         Task(title: "Write blog post", category: .work),
         Task(title: "Research new smartphone models", category: .shopping),
         Task(title: "Organize home office", category: .personal),
         Task(title: "Prepare for performance review", category: .work)]
    }
    
    static  func generateRandomTasks(count: Int) -> [Task] {
        let taskTitles = [
            "Grocery shopping", "Email to manager", "Plan weekend trip",
            "Weekly report", "Buy birthday gift", "Renew car insurance",
            "Team meeting at 10 AM", "Yoga class subscription",
            "Book dentist appointment", "Prepare project proposal",
            "Order new headphones", "Study for certification exam",
            "Client feedback call", "Pick up dry cleaning",
            "Finalize holiday plans", "Schedule home repairs",
            "Write blog post", "Research new smartphone models",
            "Organize home office", "Prepare for performance review"
        ]
        
        var randomTasks = [Task]()
        let endDate = Date()
        let startDate = endDate.goBack(days: 100)
        
        for _ in 0..<count {
            let title = taskTitles.randomElement() ?? "Default Task"
            let category = Category.allCases.randomElement() ?? .personal
            let date = Date.generateRandomDate(from: startDate, to: endDate) ?? Date()
            let isDone = [true, false].randomElement() ?? false
            let task = Task(title: title,
                            category: category,
                            creationDate: date,
                            isDone: isDone)
            
            randomTasks.append(task)
        }
        
        return randomTasks
    }
}
