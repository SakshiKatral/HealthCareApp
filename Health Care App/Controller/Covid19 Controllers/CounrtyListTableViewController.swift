//
//  CounrtyListTableViewController.swift
//  Health Care App
//
//  Created by Mac on 23/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CounrtyListTableViewController: UITableViewController {
    //MARK: - Properties
    var countryListManager = CountryListManager()
    var countryNames = [CountryName]()
    var name = ""
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        countryListManager.vc = self
        countryListManager.performURLRequest()
//        creteAndDisplaySearchBar()
        print(name)
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countryListManager.countryLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let countryList = countryListManager.countryLists[indexPath.row]
        cell.textLabel?.text = countryList.country
        
        return cell
    }
    // MARK: - Table view Delegate and Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let UpdateVC = self.storyboard?.instantiateViewController(identifier: "UpdatedDataTableViewController") as! UpdatedDataTableViewController
        UpdateVC.countryName = countryListManager.countryLists[indexPath.row].country
        self.navigationController?.pushViewController(UpdateVC, animated: true)
    }
    
    
}
