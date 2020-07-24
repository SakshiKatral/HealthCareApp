//
//  CounrtyListTableViewController.swift
//  Health Care App
//
//  Created by Mac on 23/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CounrtyListTableViewController: UITableViewController {
    //MARK: - Variable declaration
    var countryListManager = CountryListManager()
    var countryNames = [CountryName]()
    var view1: UIView!
    var searchBar: UISearchBar!
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        countryListManager.vc = self
        countryListManager.performURLRequest()
        creteAndDisplaySearchBar()
        
    }
    //MARK: - Search Bar
    func creteAndDisplaySearchBar()  {
        view1 = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        searchBar = UISearchBar(frame: CGRect(x: 10, y: 0, width: 220, height: 25))
        self.searchBar.showsCancelButton = true
        searchBar.placeholder = "Search"
        let leftNavBarButton = UIBarButtonItem(customView: view1)
        self.navigationItem.rightBarButtonItem = leftNavBarButton
        view1.addSubview(searchBar)
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
        cell.textLabel?.text = countryList.name
        
        return cell
    }
    // MARK: - Table view Delegate and Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let UpdateVC = self.storyboard?.instantiateViewController(identifier: "Covid19UpdateViewController") as! Covid19UpdateViewController
        UpdateVC.countryName = countryListManager.countryLists[indexPath.row].name
        self.navigationController?.pushViewController(UpdateVC, animated: true)
    }
    
}
