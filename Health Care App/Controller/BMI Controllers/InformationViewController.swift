//
//  AdviceViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 15/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    //MARK: - Variable declaration
    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var catagory = ""
    var informationBrain = InformationBrain()
    var data : Information?
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        data = informationBrain.getData(catagory: catagory)
        referenceImage.image = UIImage(named: data?.image ?? "")
        titleLabel.text = data?.catagory ?? ""
        descriptionLabel.text = data?.details ?? ""
    }
    
    //MARK: - Navigation
    @IBAction func clickForAdvicePresssed(_ sender: UIButton){
        self.performSegue(withIdentifier: "goToAdvice", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAdvice"{
            let adviceVC = segue.destination as? AdviceViewController
            adviceVC?.catagory = catagory
        }
    }
    @IBAction func backToResultPresses(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
