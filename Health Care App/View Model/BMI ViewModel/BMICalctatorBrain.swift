//
//  BMICalctatorBrain.swift
//  BMI Calculator App
//
//  Created by Mac on 15/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

struct BMICalculatorBrain {
//MARK: -  Properties
    var bmi : BMI?
    var infoArray = ["Female", "Male"]
    var heightarray = ["feet", "meter", "centimeter", "inch"]
    
//MARK: -  Methods
    mutating func calculateBmi(height: Float, weight: Float, unit: String) {
        var heightInMeter :Float = 0.0
        if unit == "centimeter"{
            heightInMeter = height / 100
        }
        else if unit == "feet"{
            heightInMeter = height / 3.2808
        }
        else if unit == "inch"{
            heightInMeter = height/39.370
        }
        else{
            heightInMeter = height
        }
        let bmiValue = weight / pow(heightInMeter, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, catagory: "Underweight", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, catagory: "Normal", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }
        else if bmiValue < 30 {
            bmi = BMI(value: bmiValue, catagory: "Overweight", color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, catagory: "Obese-weight", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPoint = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPoint
    }
    
    func getAdvice() -> String {
        let advice = bmi?.catagory
        return advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        let color = bmi?.color
        return color ?? .white
    }
}
