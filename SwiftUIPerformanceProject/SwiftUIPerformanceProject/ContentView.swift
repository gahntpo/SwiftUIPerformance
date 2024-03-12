//
//  ContentView.swift
//  SwiftUIPerformanceProject
//
//  Created by Karin Prater on 21.02.24.
//

import SwiftUI

struct ContentView: View {
    
    enum Selection: CaseIterable, Identifiable {
        case observableobject
        case reduceDependencies
        case observation
        case colorIdentity
        case colorIdentifiableData
        
        var id: Self { self }
        
        var displayName: String {
            switch self {
                case .observableobject:
                    "❌ ObservableObject"
                case .reduceDependencies:
                    "✅ Reduce Dependencies with ObservableObject"
                case .observation:
                    "✅ Observation Feature"
                case .colorIdentity: 
                    "❌ Color Identity Problem"
                case .colorIdentifiableData: 
                    "✅ Making Color Data"
            }
        }
        
       static var dataFlowCases: [Selection] {
            [.observableobject, .reduceDependencies, .observation]
        }
        
       static var identityCases: [Selection] {
            [.colorIdentity, .colorIdentifiableData]
        }
    }
    
    @State private var selection: Selection? = .observableobject
   
    var body: some View {
        NavigationSplitView {

            List(selection: $selection) {
                Section("View Identity") {
                    ForEach(Selection.identityCases) { selection in
                        Text(selection.displayName)
                    }
                }
                Section("Data Flow") {
                    ForEach(Selection.dataFlowCases) { selection in
                        Text(selection.displayName)
                    }
                }
            }
            
        } detail: {
            Group {
                switch selection {
                    case .observableobject:
                        ObservableObjectExampleView()
                    case .reduceDependencies:
                        ObservableObjectReduceDependenciesExampleView()
                    case .observation:
                        ObservationExampleView()
                    case .colorIdentity:
                        ColorListView()
                    case .colorIdentifiableData:
                        CustomColorListView()
                    case .none:
                        ContentUnavailableView {
                            Text("Nothing Selected")
                        }
                }
            }
            .navigationTitle(selection?.displayName ?? "none")
        }
    }
}

#Preview {
    ContentView()
}
