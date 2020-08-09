//
//  Covid19UpdateViewController.swift
//  Health Care App
//
//  Created by Mac on 18/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Covid19DetailsViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var lastUpdated : UILabel!
    @IBOutlet weak var confirmedCases : UILabel!
    @IBOutlet weak var newConfirmedCases : UILabel!
    @IBOutlet weak var recoveredCases : UILabel!
    @IBOutlet weak var newRecoveredCases : UILabel!
    @IBOutlet weak var newDeaths : UILabel!
    @IBOutlet weak var deaths : UILabel!
    @IBOutlet weak var activeCases : UILabel!
    @IBOutlet weak var total : UILabel!
    var stateDetails : StateData?
    
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        total.text = stateDetails?.state
        lastUpdated.text = stateDetails?.lastupdatedtime
        activeCases.text = stateDetails?.active
        deaths.text = stateDetails?.deaths
        confirmedCases.text = stateDetails?.confirmed
        recoveredCases.text = stateDetails?.recovered
        newDeaths.text = "↑\(stateDetails?.deltadeaths ?? "")"
        newConfirmedCases.text = "↑\(stateDetails?.deltaconfirmed ?? "")"
        newRecoveredCases.text = "↑\(stateDetails?.deltarecovered ?? "")"
        
    }
    
    //MARK: - Navigation
}

