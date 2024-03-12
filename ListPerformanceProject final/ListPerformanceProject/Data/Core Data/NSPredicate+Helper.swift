//
//  NSPredicate+Helper.swift
//  SlipboxProject
//
//  Created by Karin Prater on 19.11.22.
//

import Foundation

extension NSPredicate {
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")
    
    static func predicate(for category: Category) -> NSPredicate {
        NSPredicate(format: "category_ == %@", category.rawValue as CVarArg)
    }
}
