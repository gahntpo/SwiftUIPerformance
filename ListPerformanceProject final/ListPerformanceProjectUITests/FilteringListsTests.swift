//
//  FilteringListsTests.swift
//  ListPerformanceProjectUITests
//
//  Created by Karin Prater on 06.03.24.
//

import XCTest

final class FilteringListsTests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = [UITestingHelper.isTestingKey]
        app.launchEnvironment = [UITestingHelper.stressTestNumberKey: "10000"]
        
        app.launch()
    }
    
    override func tearDown()  {
        super.tearDown()
        app = nil
    }
    
    /*
    func testVStackFiltering() throws {
        app.collectionViews.staticTexts["VStack with ScrollView"].tap()
        
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.buttons["Work"].tap()
            app.buttons["Personal"].tap()
        }
                                
    }
     */
    
    func testListFilteringInside() throws {
        app.collectionViews.staticTexts["Filter inside List"].tap()
        
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.buttons["Work"].tap()
            app.buttons["Personal"].tap()
        }
    }
    
    func testListComputedProperty() throws {
        app.collectionViews.staticTexts["Filtering with computed property"].tap()
        
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.buttons["Work"].tap()
            app.buttons["Personal"].tap()
        }
    }
    
    func testListViewModel() throws {
        app.collectionViews.staticTexts["Filter inside View Model"].tap()
        
        measure(metrics: [XCTCPUMetric(application: app),
                          XCTMemoryMetric(application: app)]) {
            app.buttons["Work"].tap()
            app.buttons["Personal"].tap()
        }
                                
    }
    
    
}
