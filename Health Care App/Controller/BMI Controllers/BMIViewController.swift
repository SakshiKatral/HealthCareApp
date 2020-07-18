//
//  BMIViewController.swift
//  Health Care App
//
//  Created by Mac on 18/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goToCalculatePressed(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
    }

}
