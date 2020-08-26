//
//  ReportIncidentUITestCase.swift
//  IncidentReportingAppUITests
//
//  Created by Admin on 27/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest

class ReportIncidentUITest: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
    }

    func testAddReporIncidentFlow()  {
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
        
        
        // tapping on submit button
        app.buttons["Report"].tap()
        
        // checking report incident screen open or not
        XCTAssertTrue(app.otherElements["ReportIncidentUITest"].exists)
        
        // checking machine name textfield exist or not
        XCTAssertTrue(app.textFields["machineNameTextField"].exists)
        
        // checking location textfield exist or not
        XCTAssertTrue(app.textFields["locationTextField"].exists)
        
        // checking description textview exist or not
        XCTAssertTrue(app.textViews["descriptionTextView"].exists)
        
        // seeting the machine name on textfield
        app.textFields["machineNameTextField"].tap()
        app.textFields["machineNameTextField"].typeText("Tata Machine")
        
        // seeting the location name on textfield
        app.textFields["locationTextField"].tap()
        app.textFields["locationTextField"].typeText("Noida")
        
        // seeting the description  on textfield
        app.textViews["descriptionTextView"].tap()
        app.textViews["descriptionTextView"].typeText("This is dummy description")
        
        // tapping on submit button
        app.buttons["Submit"].tap()

        // checking on successfully adding report home screen is visible or not
        XCTAssertTrue(app.otherElements["homeUITest"].exists)
        
        app.terminate()
    }

}
