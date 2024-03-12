//
//  FilterSortTaskViewModel.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 05.03.24.
//

import Foundation

class SortTaskViewModel: ObservableObject {
    
    @Published var tasks: [Task]
    @Published var filteredTasks: [Task] = []
    
    @Published var selectedCategory: Category = .personal {
        didSet {
            filterTasks()
        }
    }
    
    @Published var selectedTaskSorting = TaskSorting.titleAsc {
        didSet {
            sortTasks()
        }
    }
    
    init() {
        if let numberInt = UITestingHelper.stressTestNumber {
            tasks = Task.generateRandomTasks(count: numberInt)
        } else {
            // load tasks from local storage
            
            tasks = Task.generateRandomTasks(count: 100)
        }
        
        filterTasks()
    }
    
    func filterTasks() {
        let filteredTasks = tasks.filter { $0.category == selectedCategory }
        self.filteredTasks = sort(tasks: filteredTasks, sorting: selectedTaskSorting)
    }
    
    func sortTasks() {
        filteredTasks = sort(tasks: filteredTasks, sorting: selectedTaskSorting)
    }
    
    func sort(tasks: [Task], sorting: TaskSorting) -> [Task] {
        switch sorting {
            case .titleAsc:
                return tasks.sorted(by: {
                    if $0.title != $1.title {
                     return  $0.title < $1.title
                    } else {
                        return $0.creationDate < $1.creationDate
                    }
                })
            case .titleDes:
                return tasks.sorted(by: {
                    if $0.title != $1.title {
                     return  $0.title > $1.title
                    } else {
                        return $0.creationDate < $1.creationDate
                    }
                })
            case .creationDateAsc:
                return tasks.sorted(by: { $0.creationDate < $1.creationDate })
            case .creationDateDes:
                return tasks.sorted(by: { $0.creationDate > $1.creationDate })
        }
    }
}
