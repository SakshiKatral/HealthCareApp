//
//  CounrtyListTableViewController.swift
//  Health Care App
//
//  Created by Mac on 23/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CountryListTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate,CountryListManagerDelegate {
    
    //MARK: - Properties
    var countryListManager = CountryListManager()
    var countryNames = [CountryName]()
    var name = ""
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        countryListManager.vc = self
        countryListManager.delegate = self
        countryListManager.performURLRequest()
        searchBarSetup()
        tableView.reloadData()
    }
    //MARK: - SearchBar Methods
    private func searchBarSetup(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
           guard let searchText = searchController.searchBar.text else { return }
           if searchText == "" {
               countryListManager.performURLRequest()
               
           }else{
               countryListManager.performURLRequest()
               countryListManager.countryLists = countryListManager.countryLists.filter{
                $0.country.contains(searchText)
               }
               
           }
           tableView.reloadData()
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
    
    //MARK:- Error Handling
    func didFailWithError(_ countryListManager: CountryListManager, error: String?) {
         DispatchQueue.main.async {
               let alert = UIAlertController(title: "Oops!",
                                             message: error,
                                             preferredStyle: .alert)
               let cancelAction = UIAlertAction(title: "Close",
                                                style: .default,
                                                handler: nil)
               
               alert.addAction(cancelAction)
               self.present(alert, animated: true)
               }
    }
}
