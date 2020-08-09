//
//  Country List Manager.swift
//  Health Care App
//
//  Created by Mac on 23/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
protocol CountryListManagerDelegate {
    //MARK:- Protocol
    func didFailWithError(_ countryListManager: CountryListManager, error: String?)
}

class CountryListManager {
    //MARK:- Properties
    let urlString = "https://api.covid19api.com/countries"
    var countryLists = [CountryName]()
    var vc : CountryListTableViewController?
    var delegate : CountryListManagerDelegate?
    
    //MARK:- API Call Method
    func performURLRequest()
    {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {[self] (data, response, error) in
            if error != nil{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            guard let safeData = data else{
                self.delegate?.didFailWithError(self, error: error?.localizedDescription)
                return
            }
            do{
                let countryList = try JSONDecoder().decode([CountryList].self, from: safeData)
                
                for country in countryList{
                    DispatchQueue.main.async {
                        let countryData = CountryName(country: country.country ?? "", slug: country.slug ?? "", iSO2: country.iSO2 ?? "")
                        self.countryLists.append(countryData)
                        self.vc?.tableView.reloadData()
                    }
                }
            }
            catch{
                self.delegate?.didFailWithError(self, error: error.localizedDescription)
            }
        }.resume()
    }
}
