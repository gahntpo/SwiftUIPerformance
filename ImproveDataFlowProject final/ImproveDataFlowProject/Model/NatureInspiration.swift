//
//  Destination.swift
//  LayoutProject
//
//  Created by Karin Prater on 20.06.22.
//

import Foundation

struct NatureInspiration: Identifiable, Hashable {
    
    var name: String
    let imageName: String
    let description: String
    let id = UUID()
    
    static func example() -> NatureInspiration {
        NatureInspiration(name: "Desert",
                          imageName: "desert",
                          description: "A desert is a barren area of landscape where little precipitation occurs and, consequently, living conditions are hostile for plant and animal life.")
    }
    
    static func examples() -> [NatureInspiration] {
        
        [NatureInspiration(name: "Sunset Beach",
                           imageName: "beach",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         NatureInspiration(name: "Moos Trees",
                           imageName: "trees-moos",
                           description: "In our unique moss farm we cultivate natural, pure and high performance moss. This forms the green basis for our regenerative moss filters."),
         NatureInspiration(name: "Tree",
                           imageName: "tree",
                           description: "In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves."),
         NatureInspiration(name: "Mountain Air",
                           imageName: "mountain",
                           description: "A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock")
        ]
    }

    
    static func largeExamples() -> [NatureInspiration] {
        
        [NatureInspiration(name: "Sunset Beach",
                                   imageName: "beach",
                                   description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         NatureInspiration(name: "Desert",
                           imageName: "desert",
                           description: "A desert is a barren area of landscape where little precipitation occurs and, consequently, living conditions are hostile for plant and animal life."),
         NatureInspiration(name: "Tree",
                           imageName: "tree",
                           description: "In botany, a tree is a perennial plant with an elongated stem, or trunk, usually supporting branches and leaves."),
         NatureInspiration(name: "Mountain Air",
                           imageName: "mountain",
                           description: "A mountain is an elevated portion of the Earth's crust, generally with steep sides that show significant exposed bedrock"),
         NatureInspiration(name: "Moos Trees",
                           imageName: "trees-moos",
                           description: "In our unique moss farm we cultivate natural, pure and high performance moss. This forms the green basis for our regenerative moss filters."),
         NatureInspiration(name: "Sky",
                           imageName: "sky", description: "The sky is an unobstructed view upward from the surface of the Earth. It includes the atmosphere and outer space. "),
         NatureInspiration(name: "Death Valley",
                           imageName: "death-valley",
                           description: "In this below-sea-level basin, steady drought and record summer heat make Death Valley a land of extremes. "),
        
         NatureInspiration(name: "Mont Blanc",
                           imageName: "mont-blanc",
                           description: "Mont Blanc is the highest mountain in the Alps and Western Europe. It is the second-most prominent mountain in Europe, after Mount Elbrus, and it is the eleventh most prominent mountain summit in the world."),
         NatureInspiration(name: "Rolling Hills",
                           imageName:"hills",
                           description: "A hill is a landform that extends above the surrounding terrain. It often has a distinct summit." ),
         NatureInspiration(name: "Autumn Colors",
                           imageName: "autumn",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         NatureInspiration(name: "Green Hills",
                           imageName: "green-hills",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy."),
         NatureInspiration(name: "Rainforest Bridge",
                           imageName: "sky",
                           description: "True Autumn is warm and muted. The True Autumn colour palette is reminiscent of a walk through an autumn forest – rich, warm and earthy.")
        ]
    }
}
