//
//  ReportIncidentUITestCase.swift
//  IncidentReportingAppUITests
//
//  Created by Admin on 27/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest

class ReportIncidentUITest: XCTestCase {

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
     test case for checking adding incident report is wokring
    */
    func testAddReporIncidentFlow()  {
        self.app.launch()

        // checking login ui is visble or not
        XCTAssertTrue(self.app.otherElements["loginUITest"].exists)
        
        // checking username textfield exist or not
        XCTAssertTrue(self.app.textFields["usernameTextField"].exists)
        
        // checking password textfield exist or not
        XCTAssertTrue(app.secureTextFields["passwordTextField"].exists)
        
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
        
        
        // tapping on submit button
        self.app.buttons["Report"].tap()
        
        // checking report incident screen open or not
        XCTAssertTrue(self.app.otherElements["ReportIncidentUITest"].exists)
        
        // checking machine name textfield exist or not
        XCTAssertTrue(self.app.textFields["machineNameTextField"].exists)
        
        // checking location textfield exist or not
        XCTAssertTrue(self.app.textFields["locationTextField"].exists)
        
        // checking description textview exist or not
        XCTAssertTrue(self.app.textViews["descriptionTextView"].exists)
        
        // seeting the machine name on textfield
        self.app.textFields["machineNameTextField"].tap()
        self.app.textFields["machineNameTextField"].typeText("Tata Machine")
        
        // seeting the location name on textfield
        self.app.textFields["locationTextField"].tap()
        self.app.textFields["locationTextField"].typeText("Noida")
        
        // seeting the description  on textfield
        self.app.textViews["descriptionTextView"].tap()
        self.app.textViews["descriptionTextView"].typeText("This is dummy description")
        
        // tapping on submit button
        self.app.buttons["Submit"].tap()

        // checking on successfully adding report home screen is visible or not
        XCTAssertTrue(self.app.otherElements["homeUITest"].exists)
        
        self.app.terminate()
    }

}
