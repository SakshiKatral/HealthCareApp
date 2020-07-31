//
//  State Data Manager.swift
//  Health Care App
//
//  Created by Mac on 27/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class StateDataManager{
    let urlString = "https://api.covid19india.org/data.json"
    var stateLists = [StateData]()
    var vc : StateDataTableViewController?
    var vc1 : IndiaDetailsViewController?
    func performURLRequest()
    {
        let url = URL(string: urlString)
        print(url!)
        URLSession.shared.dataTask(with: url!) {[self] (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            guard let safeData = data else{ print("data not found")
                return }
            
            do{
                let stateList = try JSONDecoder().decode(StateDataModel.self, from: safeData)
                DispatchQueue.main.async {
                    guard let states = stateList.statewise else { print("error")
                        return}
                    for state in states{
                        let stateDetails = StateData(statecode: state.statecode ?? "", state: state.state ?? "", active: state.active ?? "", confirmed: state.confirmed ?? "", recovered: state.recovered ?? "", deaths: state.deaths ?? "", statenotes: state.statenotes ?? "", deltaconfirmed: state.deltaconfirmed ?? "", deltadeaths: state.deltadeaths ?? "", deltarecovered: state.deltarecovered ?? "", lastupdatedtime: state.lastupdatedtime ?? "", migratedother: state.migratedother ?? "")
                        self.stateLists.append(stateDetails)
                        print(stateDetails)
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
