//
//  View+print.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 18.02.24.
//

/*
 
 https://developer.apple.com/documentation/swift-playgrounds/console-print-debugging#Understand-when-and-why-your-views-change
 
 */

/*
 
 let _ = Self._printChanges()
 This records which property caused the view to update and sends that information to the console. In addition to providing property names, @self marks the change to the view value, and @identity marks the change to the view’s identity.
 
 
 @self -> new view created
 @identity -> identity changed, e.g. when the id of the cell changes e.g. list with reusable cells
 
 */

import SwiftUI

extension View {
    func printOutput(_ value: Any) -> Self {
        let _ = Self._printChanges()
        print(value)
        return self
    }
}
