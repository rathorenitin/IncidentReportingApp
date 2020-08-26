//
//  IncidentReportingAppUITests.swift
//  IncidentReportingAppUITests
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest

class IncidentReportingAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
    }

    func testLoginUIFlow()  {
        app.launch()

        // checking login ui is visble or not
        XCTAssertTrue(app.otherElements["loginUITest"].exists)
        
        // checking username textfield exist or not
        XCTAssertTrue(app.textFields["usernameTextField"].exists)
        
        // checking password textfield exist or not
        XCTAssertTrue(app.secureTextFields["passwordTextField"].exists)
        
        // seeting the username on textfield
        app.textFields["usernameTextField"].tap()
        app.textFields["usernameTextField"].typeText("TestingUser")
        
        // seeting the password on textfield
        app.secureTextFields["passwordTextField"].tap()
        app.secureTextFields["passwordTextField"].typeText("Qwerty@123")
        
        // tapping on submit button
        app.buttons["Submit"].tap()

        // checking on successfully login home screen is visible or not
        XCTAssertTrue(app.otherElements["homeUITest"].exists)
        
        app.terminate()
    }

    
}
