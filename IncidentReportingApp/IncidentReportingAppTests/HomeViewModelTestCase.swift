//
//  HomeViewModelTestCase.swift
//  IncidentReportingAppTests
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import XCTest
@testable import IncidentReportingApp

class HomeViewModelTestCase: XCTestCase {

    var viewModel: HomeViewModel!
    
    
    override func setUp() {
        super.setUp()
        self.viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
    }
    
    func testForValidSearchingFunctinality() {
        
        let object1 = ReportModel(model: ReportIncidentModel(machineName: "Tata Machine", locationName: "Noida", description: "This is dummy text"))
        self.viewModel.appendReport(object1)
        
        let object2 = ReportModel(model: ReportIncidentModel(machineName: "L&T Machine", locationName: "Mumbai", description: "This is dummy text"))
        self.viewModel.appendReport(object2)
        
        let object3 = ReportModel(model: ReportIncidentModel(machineName: "Mahindra Machine", locationName: "Bengalore", description: "This is dummy text"))
        self.viewModel.appendReport(object3)
        
        self.viewModel.searchImageWithText("tata")
        
        if self.viewModel.numberOfRowsForTV() == 1 {
            XCTAssert(true, "Searched result is correct")
        } else {
            XCTAssert(false, "Searched result is incorrect")
        }
    }
    
    
    func testForInValidSearchingFunctinality() {
        
        let object1 = ReportModel(model: ReportIncidentModel(machineName: "Tata Machine", locationName: "Noida", description: "This is dummy text"))
        self.viewModel.appendReport(object1)
        
        let object2 = ReportModel(model: ReportIncidentModel(machineName: "L&T Machine", locationName: "Mumbai", description: "This is dummy text"))
        self.viewModel.appendReport(object2)
        
        let object3 = ReportModel(model: ReportIncidentModel(machineName: "Mahindra Machine", locationName: "Bengalore", description: "This is dummy text"))
        self.viewModel.appendReport(object3)
        
        self.viewModel.searchImageWithText("Bosch")
        
        if self.viewModel.numberOfRowsForTV() > 0 {
            XCTAssert(false, "Searched result is incorrect")
        } else {
            XCTAssert(true, "Searched result is correct")
        }
    }

}
