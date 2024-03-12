//
//  UITestingHelper.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 06.03.24.
//

import Foundation


struct UITestingHelper {
    
    static var isTestingKey: String = "-ui-testing"
    static var stressTestNumberKey: String = "-stress-test-number"
    
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains(isTestingKey)
    }
    
    static var stressTestNumber: Int? {
        guard let number = ProcessInfo.processInfo.environment[stressTestNumberKey],
              let numberInt = Int(number) else {
            return nil
        }
        return numberInt
    }
    
}
