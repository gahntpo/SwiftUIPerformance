//
//  FilterListView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import SwiftUI

struct FilterListView: View {
    
    @State var tasks = Task.generateRandomTasks(count: 100)
    @State private var selectedCategory: Category = .personal
    
    var filteredTasks: [Task] {
        return tasks.filter { $0.category == selectedCategory }
    }
    
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        VStack {
            CategoryPickerView(selectedCategory: $selectedCategory)
            
            List(filteredTasks, selection: $selectedTask) { task in
                TaskRow(task: task)
                    .tag(task)
            }
        }
        .navigationTitle("Computed property")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FilterListView()
}
