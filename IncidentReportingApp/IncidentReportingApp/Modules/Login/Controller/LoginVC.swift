//
//  LoginVC.swift
//  IncidentReportingApp
//
//  Created by Admin on 25/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    
    // MARK: IBOutlets
    //================
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: Properties
    //=================
    let viewModel = LoginViewModel()
    
    //MARK:- View Life Cycle
    //======================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        addAccessibilityIdentifier()
    }
    
    
    //MARK:- @IBAction
    //================
    @IBAction func submitBtnTapped(_ sender: Any) {
        self.view.endEditing(true)
        viewModel.loginUser()
    }
    
}

// MARK: Extension for private methods
//=====================================
extension LoginVC {
    
    /*
     setup for setting fonts, text color and text
     */
    private func initialSetup() {
        setUpFont()
        setUpTextColor()
        setUpText()
        prepareViewModelObserver()
        
        submitButton.backgroundColor = .black
        submitButton.layer.cornerRadius = 5
        containerView.layer.cornerRadius = 5
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /*
     setup for fonts of label, textfield and button
     */
    private func setUpFont() {
        userNameLabel.font = UIFont.systemFont(ofSize: 12)
        passwordLabel.font = UIFont.systemFont(ofSize: 12)
        userNameTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    /*
     setup for textColor of label, textfield and button
     */
    private func setUpTextColor() {
        userNameLabel.textColor = .lightGray
        passwordLabel.textColor = .lightGray
        userNameTextField.textColor = .black
        passwordTextField.textColor = .black
        submitButton.setTitleColor(.white, for: .normal)
    }
    /*
     setup for text of label, textfield and button
     */
    private func setUpText() {
        userNameLabel.text = "User Name"
        passwordLabel.text = "Password"
        userNameTextField.placeholder = "Enter username"
        passwordTextField.placeholder = "Enter password"
        submitButton.setTitle("Submit", for: .normal)
    }
    
    private func addAccessibilityIdentifier() {
        self.view.accessibilityIdentifier = "loginUITest"
        self.userNameTextField.accessibilityIdentifier = "usernameTextField"
        self.passwordTextField.accessibilityIdentifier = "passwordTextField"
    }
}

// MARK: Extension for UITextField Delegate methods
//==================================================
extension LoginVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let inputText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case userNameTextField:
            viewModel.updateUsername(inputText: inputText)
        case passwordTextField:
            viewModel.updatePassword(inputText: inputText)
        default:
            return false
        }
        
        return true
    }
}

//MARK:- API Call obsevers
//========================
extension LoginVC {
    
    /*
     oembserver for handling suceess and failure of login api
     */
    func prepareViewModelObserver() {
        
        self.viewModel.loginSuccesHandler = { (status) in
            DispatchQueue.main.async {
                NavigationRouter.shared.moveToHomeController()
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
