//
//  Covid19ViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 17/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Covid19ViewController: UIViewController {
    
    //MARK: - Properties
    var stateDataManager = StateDataManager()
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Covid19 Update"
    }
    
    //MARK: - Navigation
    @IBAction func goToCovid19UpdatePressed(_ sender: UIButton){
        let countryListVC = self.storyboard?.instantiateViewController(withIdentifier: "CounrtyListTableViewController") as! CounrtyListTableViewController
        self.navigationController?.pushViewController(countryListVC, animated: true)
    }
    
    @IBAction func goToState(_ sender: UIButton){
        let indiaDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "IndiaDetailsViewController") as! IndiaDetailsViewController
        stateDataManager.performURLRequest()
        guard let totalDetails = stateDataManager.stateLists.first else {print("nil")
            return}
        indiaDetailsVC.totalCases = totalDetails
        self.navigationController?.pushViewController(indiaDetailsVC, animated: true)
    }
}
