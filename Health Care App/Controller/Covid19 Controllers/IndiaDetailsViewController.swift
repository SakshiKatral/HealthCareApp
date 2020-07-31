//
//  IndiaDetailsViewController.swift
//  Health Care App
//
//  Created by Mac on 29/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class IndiaDetailsViewController: UIViewController {

    //MARK: - Properties
//    var stateDataManager = StateDataManager()
    var totalCases : StateData?
    @IBOutlet weak var lastUpdated : UILabel!
    @IBOutlet weak var confirmedCases : UILabel!
    @IBOutlet weak var newConfirmedCases : UILabel!
    @IBOutlet weak var recoveredCases : UILabel!
    @IBOutlet weak var newRecoveredCases : UILabel!
    @IBOutlet weak var newDeaths : UILabel!
    @IBOutlet weak var deaths : UILabel!
    @IBOutlet weak var activeCases : UILabel!
    @IBOutlet weak var total : UILabel!
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()

//        stateDataManager.vc1 = self
//        stateDataManager.performURLRequest()
        total.text = "India"
        lastUpdated.text = totalCases?.lastupdatedtime
        activeCases.text = totalCases?.active
        deaths.text = totalCases?.deaths
        confirmedCases.text = totalCases?.confirmed
        recoveredCases.text = totalCases?.recovered
        newDeaths.text = "\(totalCases?.deltadeaths ?? "")"
        newConfirmedCases.text = "\(totalCases?.deltaconfirmed ?? "")"
        newRecoveredCases.text = "\(totalCases?.deltarecovered ?? "")"
    }

    //MARK: - Navigation
    @IBAction func getStateDetails(_ sender: UIButton){
        let stateListVC = self.storyboard?.instantiateViewController(withIdentifier: "StateDataTableViewController") as! StateDataTableViewController
               self.navigationController?.pushViewController(stateListVC, animated: true)
    }
}
