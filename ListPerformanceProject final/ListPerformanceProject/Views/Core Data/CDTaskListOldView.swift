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
    @State private var selectedTask: CDTask? = nil
    
    @State private var fetchLimit: Int = 10
    
    var body: some View {
        VStack {
            Picker("Category", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List(selection: $selectedTask, content: {
                
                TaskListView(category: selectedCategory,
                             sorting: selectedSorting,
                             fetchLimit: fetchLimit)
                
                Color.gray.frame(height: 10)
                    .onAppear {
                        fetchLimit += 10
                    }
            })
           
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
    
    init(category: Category, 
         sorting: TaskSorting,
         fetchLimit: Int) {
        let predicate = NSPredicate.predicate(for: category)
        let request = CDTask.fetch(predicate)
        request.sortDescriptors = CDTask.nsSortDescriptor(for: sorting)
        request.fetchLimit = fetchLimit
        
        self._tasks = FetchRequest(fetchRequest: request, animation: .default)
    }
    
    @FetchRequest(fetchRequest: CDTask.fetch(.none)) private var tasks: FetchedResults<CDTask>
  
    
    var body: some View {
        ForEach(tasks) { task in
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
