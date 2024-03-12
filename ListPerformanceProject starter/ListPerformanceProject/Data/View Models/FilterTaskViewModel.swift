//
//  TaskViewModel.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import Foundation

class FilterTaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] 
    @Published var filteredTasks: [Task] = []
    
    @Published var selectedCategory: Category = .personal {
        didSet {
            filterTasks()
        }
    }
    
    init() {
        // load tasks from local storage
        tasks = Task.generateRandomTasks(count: 500)
        
        filterTasks()
    }
    
    func filterTasks() {
       filteredTasks = tasks.filter { $0.category == selectedCategory }
    }
}
