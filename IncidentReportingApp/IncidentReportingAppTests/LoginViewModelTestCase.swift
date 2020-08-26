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
    
    var viewModel: LoginViewModel!
    
    
    override func setUp() {
        super.setUp()
        self.viewModel = LoginViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }
    
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
