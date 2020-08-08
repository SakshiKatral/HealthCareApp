//
//  WeatherForeCastTableViewController.swift
//  Health Care App
//
//  Created by Mac on 07/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherForeCastTableViewController: UITableViewController,WeatherForecastManagerDelegate {
    
    //MARK: - Properties
    var weatherForecastManager = WeatherForecastManager()
    var cityName = ""
    var weatherDetails = [WeatherForecastDetailModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cityName)
        self.navigationItem.title = "\(cityName)"
        weatherForecastManager.delegate = self
        weatherForecastManager.fetchWeatherURL(with: cityName)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return weatherForecastManager.weatherForecastDetails.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(weatherForecastManager.weatherForecastDetails)
        return 1
    }

    func didFailWithError(_ weatherManager: WeatherForecastManager, error: Error) {
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
    
    func didUpdateWeather(_ weatherManager: WeatherForecastManager, weather: [WeatherForecastDetailModel]) {
        DispatchQueue.main.async {
            self.weatherDetails = weather
            self.tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as? WeatherForecastTableViewCell
        let weatherForecast = weatherForecastManager.weatherForecastDetails[indexPath.section]
        let colorArray = [#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1),#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1),#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1),#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1),#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)]
        cell?.backgroundColor = colorArray.randomElement()
        cell?.temparatureLable.text = "\(weatherForecast.temparature)°C"
        cell?.minTemparatureLable.text = "\(weatherForecast.temp_min)°C"
        cell?.maxTemparatureLable.text = "\(weatherForecast.temp_max)°C"
        cell?.humidityLable.text = "\(weatherForecast.humidity)g.m-3"
        cell?.pressureLable.text = "\(weatherForecast.pressure)atm"
        cell?.windDegLable.text = "\(weatherForecast.deg)"
        cell?.windSpeedLable.text = "\(weatherForecast.speed)km/h"
        return cell!
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return weatherForecastManager.weatherForecastDetails[section].date
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 0, y: 0, width: 320, height: 50)
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
       
        let headerView = UIView()
        headerView.addSubview(myLabel)
        headerView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        return headerView
    }
}
