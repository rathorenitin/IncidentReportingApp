//
//  HomeUITestCase.swift
//  IncidentReportingAppUITests
//
//  Created by Admin on 27/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest

class HomeUITestCase: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
    }
    
    func testHomeScreenFlow()  {
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
        
        // checking on before adding any report tableview cells count is 0 or not
        XCTAssertEqual(app.tables["reportListTV"].cells.count, 0, "There should be 0 row initially")
        
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
        
        
        // checking on successfully adding report nomber of cell count is 1 or not
        XCTAssertEqual(app.tables["reportListTV"].cells.count, 1, "There should be 1 row after adding report")
        
        app.terminate()
    }
    
}
