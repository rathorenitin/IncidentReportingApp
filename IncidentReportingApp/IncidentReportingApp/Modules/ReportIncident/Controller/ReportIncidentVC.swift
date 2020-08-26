//
//  ReportIncidentVC.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

protocol ReportIncidentVCDelegate: class {
    func reportAdded(_ model: ReportModel)
}

class ReportIncidentVC: BaseVC {
    
    // MARK: IBOutlets
    //================
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var machineNameLabel: UILabel!
    @IBOutlet weak var machineNameTextField: UITextField!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: Properties
    //=================
    let viewModel = ReportIncidentViewModel()
    weak var delegate: ReportIncidentVCDelegate?
    
    
    //MARK:- View Life Cycle
    //======================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    
    //MARK:- @IBAction
    //================
    @IBAction func submitBtnTapped(_ sender: Any) {
        self.view.endEditing(true)
        viewModel.submitReport()
    }
    
}

// MARK: Extension for private methods
//=====================================
extension ReportIncidentVC {
    
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
        machineNameTextField.delegate = self
        locationTextField.delegate = self
        descriptionTextView.delegate = self
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.cornerRadius = 5

    }
    
    /*
     setup for fonts of label, textfield and button
     */
    private func setUpFont() {
        machineNameLabel.font = UIFont.systemFont(ofSize: 12)
        locationLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        machineNameTextField.font = UIFont.systemFont(ofSize: 14)
        locationTextField.font = UIFont.systemFont(ofSize: 14)
        descriptionTextView.font = UIFont.systemFont(ofSize: 14)
        submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    /*
     setup for textColor of label, textfield and button
     */
    private func setUpTextColor() {
        machineNameLabel.textColor = .lightGray
        locationLabel.textColor = .lightGray
        descriptionLabel.textColor = .lightGray
        machineNameTextField.textColor = .black
        locationTextField.textColor = .black
        descriptionTextView.textColor = .black
        submitButton.setTitleColor(.white, for: .normal)
    }
    /*
     setup for text of label, textfield and button
     */
    private func setUpText() {
        machineNameLabel.text = "Machine Name"
        locationLabel.text = "Location Name"
        descriptionLabel.text = "Description"
        machineNameTextField.placeholder = ""
        locationTextField.placeholder = ""
        submitButton.setTitle("Submit", for: .normal)
    }
}
// MARK: Extension for UITextField Delegate methods
//==================================================
extension ReportIncidentVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let inputText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case machineNameTextField:
            viewModel.updateMachineName(inputText: inputText)
        case locationTextField:
            viewModel.updateLocationName(inputText: inputText)
        default:
            return false
        }
        
        return true
    }
}

// MARK: Extension for UITextView Delegate methods
//==================================================
extension ReportIncidentVC: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.updateDescription(inputText: textView.text)
    }
    
}

//MARK:- API Call obsevers
//========================
extension ReportIncidentVC {
    
    /*
     oembserver for handling suceess and failure of login api
     */
    func prepareViewModelObserver() {
        
        self.viewModel.reportSuccesHandler = {[weak self] (status, object) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                strongSelf.delegate?.reportAdded(object)
                NavigationRouter.shared.popViewController()
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
