//
//  ReportIncidentViewModel.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

//MARK:- ReportIncidentViewModel ViewModel
//=============================
class ReportIncidentViewModel: NSObject {
    
    // MARK: Properties
    //=================
    private var reportIncidentModel = ReportIncidentModel()
    var errorHandler: ((String) -> Void)?
    var reportSuccesHandler: ((Bool, ReportModel) -> Void)?

    
    //MARK:- Methods
    //================
    /*
     seting machine name
    */
    func updateMachineName(inputText: String) {
        self.reportIncidentModel.machineName = inputText.byRemovingLeadingTrailingWhiteSpaces
    }
    /*
     seting location name
    */
    func updateLocationName(inputText: String) {
        self.reportIncidentModel.locationName = inputText.byRemovingLeadingTrailingWhiteSpaces
    }
    /*
     seting description
    */
    func updateDescription(inputText: String) {
        self.reportIncidentModel.description = inputText.byRemovingLeadingTrailingWhiteSpaces
    }
    
    /*
      method check for vaidation of Report request and provide succeess or failure according to it
    */
    func submitReport() {
        let result = ValidationController.validateReportIncident(model: reportIncidentModel)
        
        if result.status {
            let object = ReportModel(model: reportIncidentModel)
            self.reportSuccesHandler?(true, object)
        } else {
            self.errorHandler?(result.errorMessage)
        }
    }
}
