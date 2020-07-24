//
//  Country Data Manager.swift
//  Health Care App
//
//  Created by Mac on 21/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class  CountryDataManager {
    var vc = BaseViewController()
    var counrtyModels = [CountryData]()
    var urlString = ""
    
    func getCountryName(country: String){
        urlString = "https://api.covid19api.com/country/\(country)/status/confirmed?from=2020-03-01T00:00:00Z&to=2020-07-22T00:00:00Z"
        print(urlString)
    }
     func performURLRequest()
    {
        guard let url = URL(string: urlString) else {
        
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: url, completionHandler: completionHandle(data: response: error: ))
        task.resume()
    }
     func completionHandle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil{
            print(error!)
            return
        }
        if let safeData = data{
            do{
                let countryResponse = try JSONDecoder().decode([CountryModel].self, from: safeData)
                print(countryResponse.count)
                
                for day in countryResponse{
                    DispatchQueue.main.async {
                        let days = CountryData(country: day.country ?? "", confirmed: day.confirmed ?? 0, deaths: day.deaths ?? 0, recovered: day.recovered ?? 0, active: day.active ?? 0, date: day.date ?? "")
                        self.counrtyModels.append(days)
                        print(self.counrtyModels.count)
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
        
    }

}
