//
//  ReportTVCell.swift
//  IncidentReportingApp
//
//  Created by Admin on 26/08/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ReportTVCell: UITableViewCell {

    // MARK: IBOutlets
    //================
    @IBOutlet var containerView: UIView!
    @IBOutlet var incidentIdLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var machineNameLabel: UILabel!
    
    // MARK: Properties
    //=================
    var reportModel: ReportModel? {
        didSet {
            configureData()
        }
    }
    
    //MARK:- View Life Cycle
    //======================
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initialSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initialSetup(){
        setUpFont()
        setUpTextColor()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        containerView.layer.cornerRadius = 5
    }
    
    /*
     setup for fonts of label, textfield and button
     */
    private func setUpFont() {
        incidentIdLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        machineNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    /*
     setup for textColor of label, textfield and button
     */
    private func setUpTextColor() {
        incidentIdLabel.textColor = .gray
        timeLabel.textColor = .gray
        machineNameLabel.textColor = .black
    }
    
    
    private func configureData() {
        guard let object = self.reportModel else {return}
        self.machineNameLabel.text = object.machineName
        self.timeLabel.text = object.reportDate
        self.incidentIdLabel.text = "\(AppStringConstant.id.localized.uppercased()): \(object.id)"

    }
}
