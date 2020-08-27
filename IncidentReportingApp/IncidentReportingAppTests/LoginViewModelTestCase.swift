//
//  LoginViewModelTestCase.swift
//  IncidentReportingAppTests
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest
@testable import IncidentReportingApp

class LoginViewModelTestCase: XCTestCase {
    
    // MARK: Properties
    //=================
    var viewModel: LoginViewModel!
    
    
    //MARK:- TestCase Life Cycle
    //==========================
    override func setUp() {
        super.setUp()
        self.viewModel = LoginViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }
    
    
    /*
     test case for checking login is working with vailid login credential
    */
    func testForValidLoginCredential() {
        self.viewModel.updateUsername(inputText: "TestingUser")
        self.viewModel.updatePassword(inputText: "Qwerty@123")
        
        self.viewModel.loginSuccesHandler = { (status) in
            XCTAssert(true, "Credential are valid")
        }
        
        self.viewModel.errorHandler = { (errorMessage) in
            XCTAssert(false, "Credential are invalid")
        }
        
        self.viewModel.loginUser()
    }
    
    /*
     test case for checking login is not working with invailid login credential
    */
    func testForInValidLoginCredential() {
        self.viewModel.updateUsername(inputText: "Test")
        self.viewModel.updatePassword(inputText: "Qwerty")
        
        self.viewModel.loginSuccesHandler = { (status) in
            XCTAssert(false, "Credential are valid")
        }
        
        self.viewModel.errorHandler = { (errorMessage) in
            XCTAssert(true, "Credential are invalid")
        }
        self.viewModel.loginUser()
    }
    
}
