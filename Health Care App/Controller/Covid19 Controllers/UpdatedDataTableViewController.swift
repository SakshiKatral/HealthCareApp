//
//  UpdatedDataTableViewController.swift
//  Health Care App
//
//  Created by Mac on 24/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class UpdatedDataTableViewController: UITableViewController {

    //MARK: - Properties
    var countryDataManager = CountryDataManager()
    var countryData = [CountryData]()
    var countryName = ""
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = countryName
        countryDataManager.vc = self
        print(countryName)
        countryDataManager.getCountryName(country: countryName)
        countryDataManager.performURLRequest()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return countryDataManager.counrtyModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CountryDataTableViewCell
        let countryData = countryDataManager.counrtyModels[indexPath.row]
        let colorArray = [#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1),#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1),#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1),#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1),#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1),#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)]
        cell?.backgroundColor = colorArray.randomElement()
        cell?.confirmedCases.text = "\(countryData.confirmed)"
        cell?.activeCases.text = "\(countryData.active)"
        cell?.recoveredCases.text = "\(countryData.recovered)"
        cell?.deaths.text = "\(countryData.deaths)"
        cell?.date.text = "\(countryData.date)"
        
        return cell!
    }
}
