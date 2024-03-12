//
//  CDSortedTaskList.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import SwiftUI

struct CDSortedTaskList: View {
    
    @FetchRequest(fetchRequest:  CDTask.fetch(.none), animation: .default)
    private var tasks: FetchedResults<CDTask>
    
    @State private var selectedCategory: Category = .personal
    @State private var selectedTask: CDTask? = nil
    
    @State private var selectedSorting = TaskSorting.creationDateAsc
    
    var body: some View {
        VStack {
            NoteListSortingPickerView(sorting: $selectedSorting)
                .padding()
            CategoryPickerView(selectedCategory: $selectedCategory)
            
            List(tasks, selection: $selectedTask) { task in
                CDTaskRow(task: task)
                    .tag(task)
            }
        }
        .navigationTitle("Sorting Core Data")
        .navigationBarTitleDisplayMode(.inline)
     
        .onAppear {
            setPredicate(for: selectedCategory)
        }
        .onChange(of: selectedCategory) { oldValue, newValue in
           setPredicate(for: newValue)
        }
        .onChange(of: selectedSorting) { oldValue, newValue in
            withAnimation {
                tasks.nsSortDescriptors = CDTask.nsSortDescriptor(for: newValue)
            }
        }
    }
    
    func setPredicate(for category: Category) {
        tasks.nsPredicate = NSPredicate.predicate(for: category)
    }
}

#Preview {
    NavigationStack {
        CDSortedTaskList()
    }
        .environment(\.managedObjectContext,
                      PersistenceController.preview.container.viewContext)
}
