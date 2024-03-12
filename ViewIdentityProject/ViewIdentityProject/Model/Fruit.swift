//
//  Fruit.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 18.02.24.
//

import Foundation

struct Fruit {
    
    var name: String
    
    static func examples() -> [Fruit] {
        [Fruit(name: "banana"), Fruit(name: "apple"), Fruit(name: "kiwi")]
    }
}
