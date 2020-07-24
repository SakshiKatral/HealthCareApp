//
//  BMIViewController.swift
//  Health Care App
//
//  Created by Mac on 18/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Navigation
    @IBAction func goToCalculatePressed(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
    }
    
}
