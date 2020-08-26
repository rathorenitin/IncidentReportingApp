//
//  HomeViewModel.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

//MARK:- Home ViewModel
//=============================
class HomeViewModel: NSObject {
    
    // MARK: Properties
    //=================
    var reportDataDidChanges: ((Bool, Bool) -> Void)?
    var errorHandler: ((String) -> Void)?
    
    
    // MARK: Private Properties
    //=================
    private var mainReportModelList = [ReportModel]()
    
    private var reportModelList = [ReportModel]() {
        didSet {
            self.reportDataDidChanges?(true, false)
        }
    }
    private var searchText = ""
    
    
    // MARK: Initializers
    //====================
    override init() {
    }
    
    // MARK: Function Implementation
    //=======================================
    
    /*
     return collectionview no of rows
     */
    func numberOfRowsForTV() -> Int{
        return reportModelList.count
    }
    
    /*
     return model for passed index
     */
    func getReportModel(_ index : Int)  -> ReportModel? {
        if reportModelList.indices.contains(index) {
            return reportModelList[index]
        }
        
        return nil
    }
    
    /*
     searching is performed for passed text
     */
    func searchImageWithText(_ searchText: String){
        if !searchText.isEmpty {
            let result =  self.mainReportModelList.filter { (model) -> Bool in
                return model.machineName.lowercased().contains(searchText.lowercased()) || model.locationName.lowercased().contains(searchText.lowercased()) || model.description.lowercased().contains(searchText.lowercased())
            }
            self.reportModelList = result
            
        } else {
            self.reportModelList = self.mainReportModelList
        }
    }
    
    /*
     adding the report model in main array and updating the UI
     */
    func appendReport(_ object: ReportModel) {
        self.mainReportModelList.append(object)
        self.reportModelList = self.mainReportModelList
    }
}
