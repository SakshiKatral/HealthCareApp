//
//  WeatherManager.swift
//  Health Care App
//
//  Created by Mac on 20/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
protocol WeatherManagerDelegate {
    func didFailWithError(_ weatherManager: WeatherManager, error: Error)
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherConditionModel)
    func didUpdateWeatherDetail(_ weatherManager: WeatherManager, weatherDetail: WeatherDetailModel)
}
extension WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherConditionModel){}
    func didUpdateWeatherDetail(_ weatherManager: WeatherManager, weatherDetail: WeatherDetailModel){}
}
class WeatherManager{
    var weatherModel = [WeatherModel]()
    var delegate : WeatherManagerDelegate?
    let decoder = JSONDecoder()
    var safeData : Data?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3d94e6a8280d5eddf1819db0038f7adc&units=metric"
    
    func fetchWeatherURL(cityName: String) {
        let str = "\(weatherURL)&q=\(cityName)"
        let urlString = str.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
        performURLRequest(with: urlString)
    }
    func performURLRequest(with urlString: String)
    {
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error != nil{
                self.delegate?.didFailWithError(self, error: error!)
                return
                
            }
            guard  let safedata = data else {
                self.delegate?.didFailWithError(self, error: error!)
                return
            }
            self.safeData = safedata
            guard let weather = self.parseJSON(safedata) else {return}
            self.delegate?.didUpdateWeather(self, weather: weather)
            
        }
        
        task.resume()
    }
    
    func detailData(safedata: Data?){
        guard let safedata = safedata else{return}
        guard let weatherDetail = self.getWeatherDetails(safedata) else {return}
        self.delegate?.didUpdateWeatherDetail(self, weatherDetail: weatherDetail)
        
    }
    func parseJSON(_ weatherData: Data) -> WeatherConditionModel? {
        
        do{
            let weatherResponse = try decoder.decode(WeatherModel.self, from: weatherData)
            let weather = WeatherConditionModel(conditionID: weatherResponse.weather?[0].id ?? 0, cityName: weatherResponse.name ?? "", temparature: weatherResponse.main?.temp ?? 0.0)
            print(weather)
            return weather
        }
        catch{
            delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
    
    func getWeatherDetails(_ weatherData: Data) -> WeatherDetailModel? {
        do{
            let weatherResponse = try decoder.decode(WeatherModel.self, from: weatherData)
            let weatherDetail = WeatherDetailModel(description: weatherResponse.weather?[0].description ?? "", pressure: weatherResponse.main?.pressure ?? 0, humidity: weatherResponse.main?.humidity ?? 0, temp_min: weatherResponse.main?.temp_min ?? 0.0, temp_max: weatherResponse.main?.temp_max ?? 0.0, speed: weatherResponse.wind?.speed ?? 0.0, deg: weatherResponse.wind?.deg ?? 0, temparature: weatherResponse.main?.temp ?? 0.0, name: weatherResponse.name ?? "")
            return weatherDetail
        }
        catch{
            delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
}
