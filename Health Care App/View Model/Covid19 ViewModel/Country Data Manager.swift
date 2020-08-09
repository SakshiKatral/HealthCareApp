//
//  Country Data Manager.swift
//  Health Care App
//
//  Created by Mac on 21/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
 //MARK:- Protocol
protocol CountryDataManagerDelegate {
func didFailWithError(_ countryDataManager: CountryDataManager, error: String?)
}

class  CountryDataManager {
     //MARK:- Properties
    var counrtyModels = [CountryData]()
    var urlString = ""
    var vc : UpdatedDataTableViewController?
    var delegate : CountryDataManagerDelegate?
    
     //MARK:- API Call Method
    func getCountryName(country: String){
        urlString = "https://api.covid19api.com/total/country/\(country)"
    }
    func performURLRequest()
    {
        guard let url = URL(string: urlString) else {
            self.delegate?.didFailWithError(self, error: "Fail to Convert in URL")
            return
        }
        URLSession.shared.dataTask(with: url) {[self] (data, response, error) in
            if error != nil{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            guard let safeData = data else{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            do{
                let countryResponse = try JSONDecoder().decode([CountryModel].self, from: safeData)
                
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
                self.delegate?.didFailWithError(self, error: error.localizedDescription)
            }
            
        }.resume()
    }
}
