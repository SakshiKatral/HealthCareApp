//
//  WeatherViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 17/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherInformationViewController: UIViewController, UITextFieldDelegate {

//MARK: - Variable declaration
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var weatherManager = WeatherManager()
    
//MARK: - LifeCycle Methods of view
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
        if let city = searchTextField.text {
            weatherManager.fetchWeatherURL(cityName: city)
        }
        
        searchTextField.text = ""
    }
    
    
    @IBAction func pressed(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BaseViewController") as! BaseViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
