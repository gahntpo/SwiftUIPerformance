//
//  ObservableNatureInspiration.swift
//  ImproveDataFlowProject
//
//  Created by Karin Prater on 28.02.24.
//

import Foundation
import Observation

@Observable
class ObservableNatureInspiration: Identifiable {
    
    var name: String
    let imageName: String
    let description: String
    let id = UUID()
    
    init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
    
    static func example() -> ObservableNatureInspiration {
        ObservableNatureInspiration(name: "Desert",
                          imageName: "desert",
                          description: "A desert is a barren area of landscape where little precipitation occurs and, consequently, living conditions are hostile for plant and animal life.")
    }
    
    
    static func examples() -> [ObservableNatureInspiration] {
        
        [ObservableNatureInspiration(name: "Sunset Beach",
                           imageName: "beach",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         ObservableNatureInspiration(name: "Moos Trees",
                           imageName: "trees-moos",
                           description: "In our unique moss farm we cultivate natural, pure and high performance moss. This forms the green basis for our regenerative moss filters."),
         ObservableNatureInspiration(name: "Tree",
                           imageName: "tree",
                           description: "In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves."),
         ObservableNatureInspiration(name: "Mountain Air",
                           imageName: "mountain",
                           description: "A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock")
        ]
    }

}
