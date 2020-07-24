//
//  Covid19ViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 17/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Covid19ViewController: UIViewController {
    
    
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
    
}
