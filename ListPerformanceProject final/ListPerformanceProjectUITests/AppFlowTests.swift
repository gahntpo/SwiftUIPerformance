//
//  AppFlowTests.swift
//  ListPerformanceProjectUITests
//
//  Created by Karin Prater on 06.03.24.
//

import XCTest

final class AppFlowTests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown()  {
        super.tearDown()
        app = nil
    }

    func testNavigationStackSelection() throws {
        app.collectionViews.staticTexts["VStack with ScrollView"].tap()
        
        XCTAssert(app.navigationBars["Scrollview with VStack"].exists, 
                  "We are not on the VStack screen")
                
    }
    
}
