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
            errorMessage = AppStringConstant.pleaseEnterUsername.localized
        }else if model.password.isEmpty {
            validationStatus = false
            errorMessage = AppStringConstant.pleaseEnterPassword.localized
        } else if model.userName.checkIfInvalid(.userName) {
            validationStatus = false
            errorMessage = AppStringConstant.enterValidUsernameMessage.localized
        }else if model.password.checkIfInvalid(.password) {
            validationStatus = false
            errorMessage = AppStringConstant.enterValidPasswordMessage.localized
        }
        
        return (status: validationStatus, errorMessage: errorMessage)
    }
    
    //MARK:- Report Incident Validation
    //==============================
    static func validateReportIncident(model: ReportIncidentModel) -> (status: Bool, errorMessage: String) {
        
        var validationStatus = true
        var errorMessage = ""
        
        if model.machineName.isEmpty {
            validationStatus = false
            errorMessage = AppStringConstant.pleaseEnterMachinename.localized
        }else if model.locationName.isEmpty {
            validationStatus = false
            errorMessage = AppStringConstant.pleaseEnterLocationname.localized
        }else if model.description.isEmpty {
            validationStatus = false
            errorMessage = AppStringConstant.pleaseEnterDescription.localized
        }else if model.machineName.count < 4 {
            validationStatus = false
            errorMessage = AppStringConstant.enterValidMachineNameMessage.localized
        }else if model.locationName.count < 4 {
            validationStatus = false
            errorMessage = AppStringConstant.enterValidLocationnameMessage.localized
        }else if model.description.count < 10 {
            validationStatus = false
            errorMessage = AppStringConstant.enterValidDescriptionMessage.localized
        }
        
        return (status: validationStatus, errorMessage: errorMessage)
    }
}
