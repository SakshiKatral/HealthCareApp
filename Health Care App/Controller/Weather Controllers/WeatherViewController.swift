//
//  WeatherInfoViewController.swift
//  Health Care App
//
//  Created by Mac on 18/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

//MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//MARK: - Navigation
    @IBAction func goToWeatherInfo(_ sender: UIButton){
        guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "WeatherInformationViewController") as? WeatherInformationViewController else { return }
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

