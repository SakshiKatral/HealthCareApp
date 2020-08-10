//
//  WeatherViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 17/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherInformationViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        navigationItem.title = "Weather Update"
        
    }
    @IBAction func locationPressed(_ sender: UIButton){
        locationManager.requestLocation()
    }
    
}

//MARK: - UITextField delegate Methods
extension WeatherInformationViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
    @IBAction func searchButtonPressed(_ sender: UIButton){
        searchTextField.endEditing(true)
    }
}


//MARK: - Navigation
extension WeatherInformationViewController{
    
    @IBAction func pressed(_ sender: UIButton){
        let weatherDetailvc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherDetailsViewController") as! WeatherDetailsViewController
        weatherDetailvc.data = weatherManager.safeData 
        self.navigationController?.pushViewController(weatherDetailvc, animated: true)
    }
    
    @IBAction func weatherForcast(_ sender: UIButton){
        let weatherForecastvc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherForeCastTableViewController") as! WeatherForeCastTableViewController
        weatherForecastvc.cityName = cityLabel.text ?? ""
        self.navigationController?.pushViewController(weatherForecastvc, animated: true)
    }
}


extension WeatherInformationViewController : WeatherManagerDelegate{
    //MARK: - Update User Interface
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherConditionModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temparatureString
            self.conditionImageView.image = UIImage(systemName: weather.condtionName)
            self.cityLabel.text = weather.cityName
        }
    }
    //MARK: - Error Handling
    func didFailWithError(_ weatherManager: WeatherManager,error: Error) {
        DispatchQueue.main.async {
            self.alertController(error: error.localizedDescription)
        }
    }
    func alertController(error : String){
        let alert = UIAlertController(title: "Oops!",
                                      message: error,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Close",
                                         style: .default,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
}

//MARK: - CLLocationManagerDelegate
extension WeatherInformationViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            alertController(error: "Unable to fetch location")
            return
        }
        locationManager.stopUpdatingLocation()
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        weatherManager.fetchWeatherURL(latitude: lat, longitude: lon)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        alertController(error: error.localizedDescription)
    }
}
