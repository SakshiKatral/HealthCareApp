//
//  WeatherDetailsViewController.swift
//  Health Care App
//
//  Created by Mac on 06/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController,WeatherManagerDelegate {
    
    //MARK: - Properties
    var weatherManager = WeatherManager()
    var data : Data?
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var minTempLable: UILabel!
    @IBOutlet weak var maxTempLable: UILabel!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var windSpeedLable: UILabel!
    @IBOutlet weak var windDegLable: UILabel!
    @IBOutlet weak var detailLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        weatherManager.delegate = self
        weatherManager.detailData(safedata: data)
    }
    
    //MARK: - Error Handling Interface
    func didFailWithError(_ weatherManager: WeatherManager, error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Oops!",
                                          message: error.localizedDescription,
                                          preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Close",
                                             style: .default,
                                             handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
        }
    }
    //MARK: - Update User Interface
    func didUpdateWeatherDetail(_ weatherManager: WeatherManager, weatherDetail: WeatherDetailModel) {
        DispatchQueue.main.async {
            self.nameLable.text = weatherDetail.name
            self.tempLable.text = "\(weatherDetail.temparature)°C"
            self.minTempLable.text = "\(weatherDetail.temp_min)°C"
            self.maxTempLable.text = "\(weatherDetail.temp_max)°C"
            self.pressureLable.text = "\(weatherDetail.pressure)atm"
            self.humidityLable.text = "\(weatherDetail.humidity)g.m-3"
            self.detailLable.text = "\(weatherDetail.description)"
            self.windDegLable.text = "\(weatherDetail.deg)°"
            self.windSpeedLable.text = "\(weatherDetail.speed)km/h"
            
        }
    }
    //MARK: - Navigation
    @IBAction func weatherForecast(_ sender: UIButton){
        let weatherForecastvc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherForeCastTableViewController") as! WeatherForeCastTableViewController
        weatherForecastvc.cityName = nameLable.text ?? ""
        self.navigationController?.pushViewController(weatherForecastvc, animated: true)
    }
    
}
