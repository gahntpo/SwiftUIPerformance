//
//  OptimizedListView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import SwiftUI

struct OptimizedListView: View {
    
    @StateObject var viewModel = FilterTaskViewModel()
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        VStack {
            CategoryPickerView(selectedCategory: $viewModel.selectedCategory)
            
            List(viewModel.filteredTasks, 
                 selection: $selectedTask) {
                TaskRow(task: $0)
                    .tag($0)
            }
        }
        .navigationTitle("OptimizedListView")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    OptimizedListView()
}
