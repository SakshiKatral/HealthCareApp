//
//  Country Data Manager.swift
//  Health Care App
//
//  Created by Mac on 21/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class  CountryDataManager {
    var counrtyModels = [CountryData]()
    var urlString = ""
    var vc : UpdatedDataTableViewController?
    func getCountryName(country: String){
        urlString = "https://api.covid19api.com/total/country/\(country)"
        print(urlString)
    }
    func performURLRequest()
    {
        guard let url = URL(string: urlString) else {
            
            return
        }
        URLSession.shared.dataTask(with: url) {[self] (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            if let safeData = data{
                do{
                    let countryResponse = try JSONDecoder().decode([CountryModel].self, from: safeData)
                    print(countryResponse)
                    
                    for day in countryResponse{
                        DispatchQueue.main.async {
                            if day.confirmed ?? 0 > 0 {
                            let days = CountryData(country: day.country ?? "", confirmed: day.confirmed ?? 0, deaths: day.deaths ?? 0, recovered: day.recovered ?? 0, active: day.active ?? 0, date: day.date ?? "")
                            self.counrtyModels.append(days)
                            self.vc?.tableView.reloadData()
                            }
                        }
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
