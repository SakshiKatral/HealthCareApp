//
//  Covid19UpdateViewController.swift
//  Health Care App
//
//  Created by Mac on 18/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Covid19UpdateViewController: UIViewController {
    
    //MARK: - Variable declaration
    @IBOutlet weak var tableview : UITableView!
    var countryDataManager = CountryDataManager()
    var countryName = ""
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(countryName)
        countryDataManager.getCountryName(country: countryName)
        countryDataManager.performURLRequest()
    }
    
    //MARK: - Navigation
}

