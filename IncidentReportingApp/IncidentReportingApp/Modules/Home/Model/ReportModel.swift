//
//  ReportModel.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


struct ReportModel {
    
    static var reportId = 0
    
    var id: Int
    var machineName: String
    var locationName: String
    var description: String
    var reportDate: String
    
    
    init(model: ReportIncidentModel) {
        self.id = ReportModel.reportId
        self.machineName = model.machineName
        self.locationName = model.locationName
        self.description = model.description
        self.reportDate = Date().toString(dateFormat: Date.DateFormat.ddMMMyyyy.rawValue)
        
        ReportModel.reportId += 1
    }
}
