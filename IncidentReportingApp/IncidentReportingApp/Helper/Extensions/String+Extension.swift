//
//  String+Extension.swift
//  IncidentReportingApp
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

enum ValidityExression : String {
    
    case userName = "^[a-zA-Z]{8,15}"
    case password = "^[a-zA-Z0-9!@#$%&*]{8,}"
}

extension String {
    
    ///Removes leading and trailing white spaces from the string
    var byRemovingLeadingTrailingWhiteSpaces:String {
        
        let spaceSet = CharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: spaceSet)
    }
    
    func checkIfValid(_ validityExression : ValidityExression) -> Bool {
        
        let regEx = validityExression.rawValue
        
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        
        return test.evaluate(with: self)
    }
    
    func checkIfInvalid(_ validityExression : ValidityExression) -> Bool {
        return !self.checkIfValid(validityExression)
    }
}

