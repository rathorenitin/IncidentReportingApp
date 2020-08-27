//
//  IncidentReportingAppUITests.swift
//  IncidentReportingAppUITests
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest

class IncidentReportingAppUITests: XCTestCase {

    // MARK: Properties
    //=================
    var app: XCUIApplication!
    
    //MARK:- TestCase Life Cycle
    //==========================
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        self.app = XCUIApplication()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.app = nil
    }

    /*
     test case for checking login login flow is working
    */
    func testLoginUIFlow()  {
        app.launch()

        // checking login ui is visble or not
        XCTAssertTrue(self.app.otherElements["loginUITest"].exists)
        
        // checking username textfield exist or not
        XCTAssertTrue(self.app.textFields["usernameTextField"].exists)
        
        // checking password textfield exist or not
        XCTAssertTrue(self.app.secureTextFields["passwordTextField"].exists)
        
        // seeting the username on textfield
        self.app.textFields["usernameTextField"].tap()
        self.app.textFields["usernameTextField"].typeText("TestingUser")
        
        // seeting the password on textfield
        self.app.secureTextFields["passwordTextField"].tap()
        self.app.secureTextFields["passwordTextField"].typeText("Qwerty@123")
        
        // tapping on submit button
        self.app.buttons["Submit"].tap()

        // checking on successfully login home screen is visible or not
        XCTAssertTrue(self.app.otherElements["homeUITest"].exists)
        
        self.app.terminate()
    }

    
}
