//
//  HomeVC.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: IBOutlets
    //================
    @IBOutlet weak var reportListTV: UITableView!
    
    // MARK: Properties
    //=================
    private var searchBar = UISearchBar()
    let viewModel = HomeViewModel()
    
    //MARK:- View Life Cycle
    //======================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        addAccessibilityIdentifier()
    }
    
    //MARK:- @IBAction
    //================
    @objc  func rightNavBarCancelBtnTapped(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
        searchForText(text: "")
        setupNavigationBarRightBuuton(true)
    }
    
    @objc  func rightNavBarReportBtnTapped(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        NavigationRouter.shared.moveToReportIncidentController(self)
    }
}

// MARK: Extension for private methods
//=====================================
extension HomeVC {
    /*
     setup for implementing delegate and datasource for tableview and collectionview, searchbar and viewmodel observers
     */
    private func initialSetup() {
        self.registerXibs()
        self.setupNavBar()
        self.prepareViewModelObserver()

        reportListTV.dataSource = self
        reportListTV.delegate = self
        
    }
    
    /*
     registering the xibs for tableview
     */
    private func registerXibs() {
        // registering xibs for tableview
        reportListTV.registerCell(with: ReportTVCell.self)
        
    }
    /*
     adding search bar in navigation bar
     */
    private func setupNavBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search Report..."
        navigationItem.titleView = searchBar
        setupNavigationBarRightBuuton(true)
    }
    
    private func setupNavigationBarRightBuuton(_ showReportButton: Bool) {
        if showReportButton {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(rightNavBarReportBtnTapped))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(rightNavBarCancelBtnTapped))
        }
    }
    
    private func addAccessibilityIdentifier() {
        self.view.accessibilityIdentifier = "homeUITest"
        self.reportListTV.accessibilityIdentifier = "reportListTV"
    }
}

//MARK:- Extension for UISearchBar Delegate
//=========================================
extension HomeVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        setupNavigationBarRightBuuton(false)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchForText(text: searchBar.text ?? "")
    }
    
    /*
     resigning the searchbar and hitting the api for result
     */
    func searchForText(text: String) {
        self.viewModel.searchImageWithText(text.byRemovingLeadingTrailingWhiteSpaces)
    }
}

//MARK:- API Call action and search result obsevers
extension HomeVC {
    
    /*
     oembserver for updating collection on success of api result, updating tableview when searched item array is updated and observer for error recevied from api
     */
    func prepareViewModelObserver() {
        
        self.viewModel.reportDataDidChanges = { [weak self] (finished, error) in
            guard let strongSelf = self else { return }
            if !error {
                DispatchQueue.main.async {
                    strongSelf.reportListTV.reloadData()
                }
            }
        }
        
        self.viewModel.errorHandler = { [weak self] (errorMessage) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                strongSelf.showAlert(with: "ERROR", message: errorMessage)
            }
        }
        
    }
    
}

//MARK:- Extension for ReportIncidentVC Delegate
//=============================================
extension HomeVC: ReportIncidentVCDelegate {
    
    func reportAdded(_ model: ReportModel) {
        self.viewModel.appendReport(model)
    }
    
}

