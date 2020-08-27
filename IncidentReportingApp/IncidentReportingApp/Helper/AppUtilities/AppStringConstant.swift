//
//  AppStringConstant.swift
//  IncidentReportingApp
//
//  Created by Admin on 27/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

enum AppStringConstant: String {
    
    // common
    case error = "Error"
    case cancel = "Cancel"
    
    // login screen
    case username = "User Name"
    case password = "Password"
    case enterUsername = "Enter username"
    case enterPassword = "Enter password"
    case submit = "Submit"

    // login validation
    case pleaseEnterUsername = "Please enter username."
    case pleaseEnterPassword = "Please enter password."
    case enterValidUsernameMessage = "Please enter valid username."
    case enterValidPasswordMessage = "Please enter valid password."
    
    // home screen
    case report = "Report"
    case searchReport = "Search Report..."
    case id = "id"

    // report incident screen
    case machineName = "Machine Name"
    case locationName = "Location Name"
    case description = "Description"
    
    // report incident validation
    case pleaseEnterMachinename = "Please enter machine name."
    case pleaseEnterLocationname = "Please enter location name."
    case pleaseEnterDescription = "Please enter description."
    case enterValidMachineNameMessage = "Please enter valid machine name."
    case enterValidLocationnameMessage = "Please enter valid location name."
    case enterValidDescriptionMessage = "Description must be 10 character long."

}

extension AppStringConstant {
    var localized: String {
        return self.rawValue
    }
}
