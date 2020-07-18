//
//  Covid19ViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 17/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Covid19ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToCovid19UpdatePressed(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToCovid19Update", sender: self)
    }

}
