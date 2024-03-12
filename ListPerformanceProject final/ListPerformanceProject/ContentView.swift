//
//  ContentView.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section("Why Use Lazy Loading") {
                    NavigationLink("VStack with ScrollView") {
                        FilteredStackView()
                    }
                    .accessibilityIdentifier("stack_link")
                }
                
                Section("Where add Filtering Logic") {
                    NavigationLink("Filter inside List") {
                        FilterInsideListView()
                    }
                    
                    NavigationLink("Filtering with computed property") {
                        FilterListView()
                    }
               
                    NavigationLink("Filter inside View Model") {
                        OptimizedListView()
                    }
                }
                
                Section("Complex Database") {
                    NavigationLink("Core Data") {
                        CDTaskListView()
                    }
                    
                    CDDummyDataButton()
                        .padding(.top)
                }
            }
            .navigationTitle("List Performance")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, 
                               PersistenceController.preview.container.viewContext)
}
