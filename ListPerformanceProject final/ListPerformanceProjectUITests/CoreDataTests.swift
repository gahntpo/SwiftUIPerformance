//
//  CoreDataTests.swift
//  ListPerformanceProjectUITests
//
//  Created by Karin Prater on 06.03.24.
//

import XCTest

final class CoreDataTests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = [UITestingHelper.isTestingKey]
        app.launchEnvironment = [UITestingHelper.stressTestNumberKey: "50000"]
        
        app.launch()
    }
    
    override func tearDown()  {
        super.tearDown()
        app = nil
    }
    
    func testListViewModel() throws {
        app.collectionViews.staticTexts["Filter inside View Model"].tap()
        
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.buttons["Work"].tap()
            app.buttons["Personal"].tap()
        }
                                
    }
    
    func testListCoreData() throws {
        app.collectionViews.staticTexts["Core Data"].tap()
        
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.buttons["Work"].tap()
            app.buttons["Personal"].tap()
        }
                                
    }
    
    
    
}
