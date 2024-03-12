//
//  CDDummyDataButton.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 05.03.24.
//

import SwiftUI

struct CDDummyDataButton: View {
    
    @Environment(\.managedObjectContext) var context
    
    @State private var number: Int = 100
    
    var body: some View {
       #if DEBUG
        HStack {
            TextField("Number", value: $number, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
       
            
            Button("Add elements") {
                PersistenceController.addTestData(testNumber: number, in: context)
            }
            .buttonStyle(.bordered)
        }
     #endif
    }
}

#Preview {
    CDDummyDataButton()
        .environment(\.managedObjectContext,
                      PersistenceController.preview.container.viewContext)
}
