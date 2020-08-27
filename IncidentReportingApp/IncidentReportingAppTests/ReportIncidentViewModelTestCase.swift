//
//  ReportIncidentViewModelTestCase.swift
//  IncidentReportingAppTests
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest
@testable import IncidentReportingApp

class ReportIncidentViewModelTestCase: XCTestCase {

    // MARK: Properties
    //=================
    var viewModel: ReportIncidentViewModel!
    
    //MARK:- TestCase Life Cycle
    //==========================
    override func setUp() {
        super.setUp()
        self.viewModel = ReportIncidentViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }
    
    /*
     test case for checking report incident is working with vailid report data
    */
    func testForValidIncidentReport() {
        self.viewModel.updateMachineName(inputText: "Tata Machine")
        self.viewModel.updateLocationName(inputText: "Noida")
        self.viewModel.updateDescription(inputText: "This is dummy description")

        self.viewModel.reportSuccesHandler = { (status, object) in
            XCTAssert(true, "Credential are valid")
        }
        
        self.viewModel.errorHandler = { (errorMessage) in
            XCTAssert(false, "Credential are invalid")
        }
        
        self.viewModel.submitReport()
    }
    
    /*
     test case for checking report incident is not working with invailid report data
    */
    func testForInValidIncidentReport() {
        self.viewModel.updateMachineName(inputText: "Tata Machine")
        self.viewModel.updateLocationName(inputText: "")
        self.viewModel.updateDescription(inputText: "test")

        self.viewModel.reportSuccesHandler = { (status, object) in
            XCTAssert(false, "Credential are valid")
        }
        
        self.viewModel.errorHandler = { (errorMessage) in
            XCTAssert(true, "Credential are invalid")
        }
        
        self.viewModel.submitReport()
    }

}
