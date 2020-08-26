//
//  ValidationController.swift
//  IncidentReportingApp
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class ValidationController {
    
    private init() {}
    
    //MARK:- Login Validation
    //==============================
    static func validateLoginCredential(model: LoginModel) -> (status: Bool, errorMessage: String) {
        
        var validationStatus = true
        var errorMessage = ""
        
        if model.userName.isEmpty {
            validationStatus = false
            errorMessage = "Please enter username."
        }else if model.password.isEmpty {
            validationStatus = false
            errorMessage = "Please enter password."
        } else if model.userName.checkIfInvalid(.userName) {
            validationStatus = false
            errorMessage = "Please enter valid username."
        }else if model.password.checkIfInvalid(.password) {
            validationStatus = false
            errorMessage = "Please enter valid password."
        }
        
        return (status: validationStatus, errorMessage: errorMessage)
    }
    
    //MARK:- Login Validation
    //==============================
    static func validateReportIncidentCredential(model: ReportIncidentModel) -> (status: Bool, errorMessage: String) {
        
        var validationStatus = true
        var errorMessage = ""
        
        if model.machineName.isEmpty {
            validationStatus = false
            errorMessage = "Please enter machine name."
        }else if model.locationName.isEmpty {
            validationStatus = false
            errorMessage = "Please enter location name."
        }else if model.description.isEmpty {
            validationStatus = false
            errorMessage = "Please enter description."
        }else if model.machineName.count < 4 {
            validationStatus = false
            errorMessage = "Please enter valid machine name."
        }else if model.locationName.count < 4 {
            validationStatus = false
            errorMessage = "Please enter valid location name."
        }else if model.description.count < 10 {
            validationStatus = false
            errorMessage = "description must be 10 character long."
        }
        
        return (status: validationStatus, errorMessage: errorMessage)
    }
}

