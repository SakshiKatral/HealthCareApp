//
//  WeatherManager.swift
//  Health Care App
//
//  Created by Mac on 20/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct WeatherManager{
    
    var weatherModel = [WeatherModel]()
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3d94e6a8280d5eddf1819db0038f7adc&units=metric"

     func fetchWeatherURL(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("url = \(urlString)")
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=3d94e6a8280d5eddf1819db0038f7adc&units=metric&q=Pune ")
        performURLRequest(urlString: url)
    }
     func performURLRequest(urlString urlValue: URL?)
    {
//        print(urlValue)
//         let url = URL(fileURLWithPath: urlValue) else {
//            print("Error")
//            return
//        }
        let task = URLSession.shared.dataTask(with: urlValue!, completionHandler: complitioHandler)
        task.resume()
    }
    
    func complitioHandler(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!.localizedDescription)
            return
            
        }
        if let safedata = data{
            do{
                let weatherResponse = try JSONSerialization.jsonObject(with: safedata, options: []) as! Dictionary<String, Any>
                print(weatherResponse)
            }
            catch{
                print(error)
            }
            
        }
        
    }
    
}
