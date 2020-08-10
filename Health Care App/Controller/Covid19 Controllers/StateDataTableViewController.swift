//
//  StateDataCollectionViewController.swift
//  Health Care App
//
//  Created by Mac on 27/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class StateDataTableViewController: UITableViewController{
    
    //MARK: - Properties
    var stateDataManager = StateDataManager()
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        stateDataManager.vc = self
        stateDataManager.performURLRequest()
        self.navigationItem.title = "State List"
    }
}
extension StateDataTableViewController{
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (stateDataManager.stateLists.count - 1)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let stateDetails = stateDataManager.stateLists[(indexPath.row)+1]
        cell.textLabel?.text = stateDetails.state
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dummyAction("Swipe to get more information")
    }
}

extension StateDataTableViewController {
    //MARK: - Swipe Action and Navigation
    func dummyAction(_ message: String) {
        let alert = UIAlertController(title: "Information",
                                      message: message,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Close",
                                         style: .default,
                                         handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    override func tableView(_ tableView: UITableView,
                            leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let actionMove = UIContextualAction(style: .normal,
                                            title:  "Country List",
                                            handler: { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
                                                self.navigateToCountryList()
        })
        actionMove.backgroundColor = .blue
        
        let actionEdit = UIContextualAction(style: .normal,
                                            title:  "India's Total",
                                            handler: { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
                                                self.navigateToIndia()
        })
        actionEdit.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [actionMove, actionEdit])
        return configuration
    }
    
    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let actionDelete = UIContextualAction(style: .normal,
                                              title:  "Details",
                                              handler: { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
                                                self.navigate(stateData: self.stateDataManager.stateLists[indexPath.row + 1])
        })
        actionDelete.backgroundColor = .systemPink
        let actionView = UIContextualAction(style: .normal,
                                            title:  "Covid19 Tab",
                                            handler: { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
                                                self.navigateTocovid19Tab()
        })
        actionView.backgroundColor = .systemIndigo
        let configuration = UISwipeActionsConfiguration(actions: [actionDelete, actionView])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

extension StateDataTableViewController : StateDataManagerDelegate{
    //MARK: -  Error Hadling
    func didFailWithError(_ stateDataManager: StateDataManager, error: String?) {
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

extension StateDataTableViewController{
    // MARK: - Navigation
    func navigate(stateData: StateData){
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "Covid19DetailsViewController") as! Covid19DetailsViewController
        detailVC.stateDetails = stateData
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    func navigateToCountryList(){
        let countryListVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryListTableViewController") as! CountryListTableViewController
        self.navigationController?.pushViewController(countryListVC, animated: true)
    }
    func navigateToIndia(){
        let indiaDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "IndiaDetailsViewController") as! IndiaDetailsViewController
        stateDataManager.performURLRequest()
        guard let totalDetails = stateDataManager.stateLists.first else {print("nil")
            return}
        indiaDetailsVC.totalCases = totalDetails
        self.navigationController?.pushViewController(indiaDetailsVC, animated: true)
    }
    func navigateTocovid19Tab(){
        let covid19VC = self.storyboard?.instantiateViewController(withIdentifier: "Covid19ViewController") as! Covid19ViewController
        self.navigationController?.pushViewController(covid19VC, animated: true)
    }
    
}
