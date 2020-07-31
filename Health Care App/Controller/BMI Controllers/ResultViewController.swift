//
//  ResultViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 12/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    var bmiValue : String?
    var advice : String?
    var color : UIColor?
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    //MARK: - Navigation
    @IBAction func reCalculatePressed(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func detailsOnTapped(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToInformation", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInformation"{
            let informationVC = segue.destination as? InformationViewController
            informationVC?.catagory = advice ?? ""
        }
    }
}
