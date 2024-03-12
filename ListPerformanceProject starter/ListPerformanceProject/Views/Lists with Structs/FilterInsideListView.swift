//
//  FilterInsideListView.swift
//  IOSTestProject
//
//  Created by Karin Prater on 03.03.24.
//

import SwiftUI

struct FilterInsideListView: View {
    
    @State var tasks = Task.generateRandomTasks(count: 100)
    
    @State private var selectedCategory: Category = .personal
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        VStack {
            CategoryPickerView(selectedCategory: $selectedCategory)
            
            List(tasks, selection: $selectedTask) { task in
                if task.category == selectedCategory {
                    TaskRow(task: task)
                        .tag(task)
                }
            }
        }
        .navigationTitle("Filter inside List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FilterInsideListView()
}
