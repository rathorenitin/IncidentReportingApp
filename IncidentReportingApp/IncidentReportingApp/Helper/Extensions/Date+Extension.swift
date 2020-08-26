//
//  Date+Extension.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK:- DATE FORMAT ENUM
    //==========================
    enum DateFormat : String {
        
        case yyyy_MM_dd = "yyyy-MM-dd"
        case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
        case yyyyMMddTHHmmssz = "yyyy-MM-dd'T'HH:mm:ssZ"
        case yyyyMMddTHHmmssssZZZZZ = "yyyy-MM-dd'T'HH:mm:ss.ssZZZZZ"
        case yyyyMMdd = "yyyy/MM/dd"
        case dMMMyyyy = "d MMM, yyyy"
        case ddMMMyyyy = "dd MMM, yyyy"
        case MMMdyyyy = "MMM d, yyyy"
        case hmmazzz = "h:mm a zzz"
        case dd = "dd"
        case mm = "MM"
        case yyyy = "YYYY"
        case EComaddMMMyy = "E, dd MMM yy"
        case ddMMM = "dd MMM"
    }
    
    
    /// Converts a given Date into String based on the date format and timezone provided
    func toString(dateFormat: String, timeZone: TimeZone = TimeZone.current) -> String {
        let frmtr = DateFormatter()
        frmtr.locale = Locale(identifier: "en_US_POSIX")
        frmtr.dateFormat = dateFormat
        frmtr.timeZone = timeZone
        return frmtr.string(from: self)
    }
}
