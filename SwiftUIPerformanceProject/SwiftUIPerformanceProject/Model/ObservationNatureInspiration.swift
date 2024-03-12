//
//  ObservationNatureInspiration.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 18.02.24.
//

import Foundation
import Observation

@Observable
class ObservationNatureInspiration: Identifiable {
    
    var name: String
    let imageName: String
    let description: String
    let id: UUID
    
    init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
        self.id = UUID()
    }
    
    static func example() -> ObservationNatureInspiration {
        ObservationNatureInspiration(name: "Desert",
                          imageName: "desert",
                          description: "A desert is a barren area of landscape where little precipitation occurs and, consequently, living conditions are hostile for plant and animal life.")
    }
    
    static func examples() -> [ObservationNatureInspiration] {
        
        [ObservationNatureInspiration(name: "Sunset Beach",
                                   imageName: "beach",
                                   description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         ObservationNatureInspiration(name: "Moos Trees",
                           imageName: "trees-moos",
                           description: "In our unique moss farm we cultivate natural, pure and high performance moss. This forms the green basis for our regenerative moss filters."),
         ObservationNatureInspiration(name: "Tree",
                           imageName: "tree",
                           description: "In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves."),
         ObservationNatureInspiration(name: "Mountain Air",
                           imageName: "mountain",
                           description: "A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock"),
         /*

         ObservationNatureInspiration(name: "Sky",
                           imageName: "sky", description: "The sky is an unobstructed view upward from the surface of the Earth. It includes the atmosphere and outer space. "),
         ObservationNatureInspiration(name: "Death Valley",
                           imageName: "death-valley",
                           description: "In this below-sea-level basin, steady drought and record summer heat make Death Valley a land of extremes. "),
        
         ObservationNatureInspiration(name: "Mont Blanc",
                           imageName: "mont-blanc",
                           description: "Mont Blanc is the highest mountain in the Alps and Western Europe. It is the second-most prominent mountain in Europe, after Mount Elbrus, and it is the eleventh most prominent mountain summit in the world."),
         ObservationNatureInspiration(name: "Rolling Hills",
                           imageName:"hills",
                           description: "A hill is a landform that extends above the surrounding terrain. It often has a distinct summit." ),
         ObservationNatureInspiration(name: "Automn Colors",
                           imageName: "automn",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         ObservationNatureInspiration(name: "Green Hills",
                           imageName: "green-hills",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."), */
                                                                
        ]
    }
    
    
    
    static func example1() -> ObservationNatureInspiration {
        ObservationNatureInspiration(name: "Sky",
                          imageName: "sky", description: "The sky is an unobstructed view upward from the surface of the Earth. It includes the atmosphere and outer space. ")
    }
}

extension ObservationNatureInspiration: Hashable {
    static func == (lhs: ObservationNatureInspiration, rhs: ObservationNatureInspiration) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
