//
//  WeatherForecastManager.swift
//  Health Care App
//
//  Created by Mac on 07/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//MARK:- Protocol
protocol WeatherForecastManagerDelegate {
    func didFailWithError(_ weatherManager: WeatherForecastManager, error: String?)
    func didUpdateWeather(_ weatherManager: WeatherForecastManager, weather: [WeatherForecastDetailModel])
}
class WeatherForecastManager{
    //MARK:- Properties
    var weatherForcastModel = [WeatherForecastModel]()
    var delegate : WeatherForecastManagerDelegate?
    let decoder = JSONDecoder()
    var weatherForecastDetails = [WeatherForecastDetailModel]()
    var safeData : Data?
    let weatherForecastURL = "https://api.openweathermap.org/data/2.5/forecast?appid=3d94e6a8280d5eddf1819db0038f7adc&units=metric"
    
    //MARK:- API Call
    func fetchWeatherURL(with cityName: String) {
        let str = "\(weatherForecastURL)&q=\(cityName)"
        let urlString = str.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
        performURLRequest(with: urlString)
    }
    func performURLRequest(with urlString: String)
    {
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error != nil{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
                
            }
            guard  let safedata = data else {
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            self.safeData = safedata
            DispatchQueue.main.async {
                guard let weather = self.parseJSON(safedata) else {return}
                self.delegate?.didUpdateWeather(self, weather: weather)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> [WeatherForecastDetailModel]? {
        
        do{
            let weatherResponse = try decoder.decode(WeatherForecastModel.self, from: weatherData)
            DispatchQueue.main.async {
                
                guard let weatherForcast = weatherResponse.list else {
                    self.delegate?.didFailWithError(self, error: "Data not found")
                    return
                }
                for weatherDetail in weatherForcast{
                    let weatherForecastDetail = WeatherForecastDetailModel(description: weatherResponse.city?.name?.description ?? "", pressure: weatherDetail.main?.pressure ?? 0, humidity: weatherDetail.main?.humidity ?? 0, temp_min: weatherDetail.main?.temp_min ?? 0.0, temp_max: weatherDetail.main?.temp_max ?? 0.0, speed: weatherDetail.wind?.speed ?? 0.0, deg: weatherDetail.wind?.deg ?? 0, temparature: weatherDetail.main?.temp ?? 0.0, name: weatherResponse.city?.name ?? "", date: weatherDetail.dt_txt ?? "")
                    
                    self.weatherForecastDetails.append(weatherForecastDetail)
                }
            }
            return weatherForecastDetails
        }
        catch{
            delegate?.didFailWithError(self, error: error.localizedDescription)
            return nil
        }
    }
}
