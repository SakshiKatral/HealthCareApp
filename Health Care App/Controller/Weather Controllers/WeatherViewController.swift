//
//  WeatherViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 17/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton){
        searchTextField.endEditing(true)
    }
// MARK: UITextField delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("search is \(searchTextField.text ?? "")")
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use searchTextField.text to get the weather for that city
        searchTextField.text = ""
    }
}
