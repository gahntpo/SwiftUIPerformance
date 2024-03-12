//
//  CDTaskListView.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import SwiftUI

struct CDTaskListView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: CDTask.fetch(.none))
    private var tasks: FetchedResults<CDTask>
    
    @State private var selectedCategory: Category = .personal
    @State private var selectedTask: CDTask? = nil
    
    var body: some View {
        VStack {
            CategoryPickerView(selectedCategory: $selectedCategory)
            
            List(tasks, id: \.uuid, selection: $selectedTask) { task in
                CDTaskRow(task: task)
                    .tag(task)
            }
        }
        .navigationTitle("Core Data")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            setPredicate(for: Category.personal)
        }
        .onChange(of: selectedCategory) { oldValue, newValue in
            setPredicate(for: newValue)
        }
    }
    
    func setPredicate(for category: Category) {
        tasks.nsPredicate = NSPredicate.predicate(for: category)
    }
}

#Preview {
    CDTaskListView()
        .environment(\.managedObjectContext, 
                      PersistenceController.preview.container.viewContext)
}
