//
//  FilteredStackView.swift
//  IOSTestProject
//
//  Created by Karin Prater on 03.03.24.
//

import SwiftUI

struct FilteredStackView: View {
    @State var tasks = Task.generateRandomTasks(count: 100)
    @State private var selectedCategory: Category = .personal
    
    var filteredTasks: [Task] {
        return tasks.filter { $0.category == selectedCategory }
    }
    
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        VStack {
            CategoryPickerView(selectedCategory: $selectedCategory)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(filteredTasks) { task in
                        TaskRow(task: task)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                            .tag(task)
                    }
                }
            }
            .contentMargins(20)
        }
        .navigationTitle("Scrollview with VStack")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FilteredStackView()
}
