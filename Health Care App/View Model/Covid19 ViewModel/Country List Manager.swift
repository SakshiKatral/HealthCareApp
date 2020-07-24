//
//  Country List Manager.swift
//  Health Care App
//
//  Created by Mac on 23/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class CountryListManager {
    let urlString = "https://restcountries.eu/rest/v2/all"
    var countryLists = [CountryName]()
    var vc : CounrtyListTableViewController?
    func performURLRequest()
    {
        let url = URL(string: urlString)
        print(url!)
        URLSession.shared.dataTask(with: url!) {[self] (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            guard let safeData = data else{ return }
            do{
                let countryList = try JSONDecoder().decode([CountryList].self, from: safeData)
                
                    
                    for country in countryList{
                        DispatchQueue.main.async {
                            let countryData = CountryName(name: country.name ?? "", alpha2Code: country.alpha2Code ?? "")
                        self.countryLists.append(countryData)
                            self.vc?.tableView.reloadData()
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
