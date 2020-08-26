//
//  NavigationRouter.swift
//  IncidentReportingApp
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class NavigationRouter {
    
    static let shared  = NavigationRouter()
    var navigationController = UINavigationController()
    var window: UIWindow?
    
    private init() {
        
    }
    
    func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
    
    func dismissViewController() {
        self.navigationController.dismiss(animated: true, completion: nil)
    }
    
    
    func initialViewController(window: UIWindow?) {
        
        let loginVCScene =  LoginVC.instantiate(fromAppStoryboard: .Main)
        navigationController = UINavigationController(rootViewController: loginVCScene)
        navigationController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navigationController
        self.window = window
    }
    
    func moveToHomeController() {
        let homeVCScene =  HomeVC.instantiate(fromAppStoryboard: .Main)
        navigationController = UINavigationController(rootViewController: homeVCScene)
        window?.rootViewController = navigationController
    }
    
    func moveToReportIncidentController(_ delegate: ReportIncidentVCDelegate? = nil) {
        let reportIncidentVCScene =  ReportIncidentVC.instantiate(fromAppStoryboard: .Main)
        reportIncidentVCScene.delegate = delegate
        navigationController.pushViewController(reportIncidentVCScene, animated: true)
    }
}
