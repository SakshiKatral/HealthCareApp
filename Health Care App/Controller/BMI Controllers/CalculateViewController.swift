//
//  ViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 12/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UIPopoverPresentationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var weightSlider : UISlider!
    @IBOutlet weak var heightSlider : UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightButton: UIButton!
    
    
    var info = ""
    let popoverView = UIView()
    let infoPicker = UIPickerView()
    var bmiCalculatorBrain = BMICalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        infoPicker.dataSource = self
        infoPicker.delegate = self
        infoPicker.backgroundColor = .systemIndigo
    }
    
    //MARK: BMI calculation
    @IBAction func weightHeightSliderChanged(_ sender: UISlider){
        
        if sender == heightSlider{
            heightLabel.text = String(format: "%.2f", sender.value)
        }
        else if sender == weightSlider{
            weightLabel.text = String(format: "%.0f", sender.value)
        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        let unit = heightButton.currentTitle ?? ""
        if unit == "centimeter"{
            heightSlider.maximumValue = 500
        }
        else if unit == "feet"{
            heightSlider.maximumValue = 15
        }
        else if unit == "inch"{
            heightSlider.maximumValue = 200
        }
        else{
            heightSlider.maximumValue = 5
        }
        bmiCalculatorBrain.calculateBmi(height: height, weight: weight, unit: unit)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let resultVC = segue.destination as? ResultViewController
            resultVC?.bmiValue = bmiCalculatorBrain.getBMIValue()
            resultVC?.advice = bmiCalculatorBrain.getAdvice()
            resultVC?.color = bmiCalculatorBrain.getColor()
            
        }
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
// MARK: PopOverView to get unit information
extension CalculateViewController{
    @IBAction func showPicker(_ sender: UIButton) {
        
        
        let infoPickerSize = CGSize(width: 320, height: 216) //Date picker size
        infoPicker.frame = CGRect(x: 0, y: self.view.safeAreaInsets.bottom, width: infoPickerSize.width, height: infoPickerSize.height)
        popoverView.backgroundColor = UIColor.clear
        popoverView.addSubview(infoPicker)
        let popoverViewController = UIViewController()
        popoverViewController.view = popoverView
        popoverViewController.view.frame = CGRect(x: 0, y: 0, width: infoPickerSize.width, height: infoPickerSize.height)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = infoPickerSize
        popoverViewController.popoverPresentationController?.sourceView = sender // source button
        popoverViewController.popoverPresentationController?.sourceRect = sender.bounds // source button bounds
        popoverViewController.popoverPresentationController?.delegate = self // to handle popover delegate methods
        self.present(popoverViewController, animated: true, completion: nil)
        
    }
}
//MARK: PickerView Delegate methos
extension CalculateViewController{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return bmiCalculatorBrain.heightarray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return bmiCalculatorBrain.heightarray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let row = infoPicker.selectedRow(inComponent: 0)
        heightButton.setTitle(bmiCalculatorBrain.heightarray[row], for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
}
