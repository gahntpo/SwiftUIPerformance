//
//  TaskViewModel.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 05.03.24.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task]
    
    init() {
        if let numberInt = UITestingHelper.stressTestNumber {
            tasks = Task.generateRandomTasks(count: numberInt)
        } else {
            // load tasks from local storage
            
            tasks = Task.generateRandomTasks(count: 100)
        }
    }
    
}
