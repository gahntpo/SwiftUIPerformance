//
//  LastCoreDateView.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 05.03.24.
//

import SwiftUI
import CoreData

struct CDTaskListOldView: View {
    
    @State private var selectedCategory: Category = .personal
    @State private var selectedSorting = TaskSorting.creationDateAsc
    
    var body: some View {
        VStack {
            Picker("Category", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            
            TaskListView(category: selectedCategory,
                         sorting: selectedSorting)
            .navigationTitle("Sorting Core Data")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
             NoteListSortingPickerView(sorting: $selectedSorting)
            }
        }
    }
}

fileprivate struct TaskListView: View {
    
    init(category: Category, sorting: TaskSorting) {
        let predicate = NSPredicate.predicate(for: category)
        let request = CDTask.fetch(predicate)
        request.sortDescriptors = CDTask.nsSortDescriptor(for: sorting)
        self._tasks = FetchRequest(fetchRequest: request, animation: .default)
    }
    
    @FetchRequest(fetchRequest: CDTask.fetch(.none)) private var tasks: FetchedResults<CDTask>
    @State private var selectedTask: CDTask? = nil
    
    var body: some View {
        List(tasks, selection: $selectedTask) { task in
            CDTaskRow(task: task)
                .tag(task)
        }
    }
}

#Preview {
    NavigationStack {
        CDTaskListOldView()
    }
        .environment(\.managedObjectContext,
                      PersistenceController.preview.container.viewContext)
    
}
