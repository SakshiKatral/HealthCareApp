//
//  WeatherInfoViewController.swift
//  Health Care App
//
//  Created by Mac on 18/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goToWeatherInfo(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToWeatherInfo", sender: self)
    }
}
