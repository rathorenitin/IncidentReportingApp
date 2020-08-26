//
//  LoginViewModel.swift
//  IncidentReportingApp
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

//MARK:- LoginViewModel ViewModel
//=============================
class LoginViewModel: NSObject {
    
    // MARK: Properties
    //=================
    private var loginModel = LoginModel()
    var errorHandler: ((String) -> Void)?
    var loginSuccesHandler: ((Bool) -> Void)?

    
    //MARK:- Methods
    //================
    /*
     seting username
    */
    func updateUsername(inputText: String) {
        self.loginModel.userName = inputText.byRemovingLeadingTrailingWhiteSpaces
    }
    /*
     seting password
    */
    func updatePassword(inputText: String) {
        self.loginModel.password = inputText.byRemovingLeadingTrailingWhiteSpaces
    }
    
    /*
     login method check for vaidation of credential and provide succeess or failure according to it
    */
    func loginUser() {
        let result = ValidationController.validateLoginCredential(model: loginModel)
        
        if result.status {
            self.loginSuccesHandler?(true)
        } else {
            self.errorHandler?(result.errorMessage)
        }
    }
}
