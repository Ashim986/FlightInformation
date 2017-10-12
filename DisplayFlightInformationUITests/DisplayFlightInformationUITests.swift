//
//  DisplayFlightInformationUITests.swift
//  DisplayFlightInformationUITests
//
//  Created by ashim Dahal on 10/11/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import XCTest

class DisplayFlightInformationUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let enterCodeTextField = app.textFields["Enter Code"]
        enterCodeTextField.tap()
        enterCodeTextField.typeText("SFO")
        
        let searchButton = app.buttons["Search"]
        searchButton.tap()
        app.navigationBars["Flight Information Detail"].buttons["Back"].tap()
        enterCodeTextField.tap()
        enterCodeTextField.typeText("SEA")
        searchButton.tap()
        
        
        
    }
    
}
