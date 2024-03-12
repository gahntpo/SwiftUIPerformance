//
//  ListPerformanceProjectApp.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import SwiftUI

@main
struct ListPerformanceProjectApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
