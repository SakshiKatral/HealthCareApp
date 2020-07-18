//
//  InformationBrain.swift
//  BMI Calculator App
//
//  Created by Mac on 15/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
struct InformationBrain {
    let information = [Information(image: "UnderWeight.jpg", catagory: "Underweight", details: "If your BMI is less than 18.5, it falls within the underweight range.Being underweight is associated with an increased risk for mortality when compared to people with an average BMI. The researchers suggested that being underweight may impair a person’s healing processes following an accident or trauma compared to a person with an average BMI.") ,
                       Information(image: "NormalWeight.png", catagory: "Normal", details: "If your BMI is 18.5 to 24.9, it falls within the normal or Healthy Weight range. Reaching and maintaining a healthy weight is important for overall health and can help you prevent and control many diseases and conditions." ),
                       Information(image: "OverWeight.jpg", catagory: "Overweight", details: "If your BMI is 25.0 to 29.9, it falls within the overweight range. Overweight is having extra body weight from muscle, bone, fat, and/or water. Overweight may increase the risk of many health problems, including diabetes, heart disease, and certain cancers. If you are pregnant, excess weight may lead to short- and long-term health problems for you and your child."),
                       Information(image: "ObsesWeight.jpg", catagory: "Obese-weight", details: "If your BMI is 30.0 or higher, it falls within the obese range. Obesity is having a high amount of extra body fat.People who have obesity, compared to those with a healthy weight, are at increased risk for many serious diseases and health conditions. Obesity is frequently subdivided into categories-Class 1: BMI of 30 to < 35, Class 2: BMI of 35 to < 40, Class 3: BMI of 40 or higher. Class 3 obesity is sometimes categorised as “extreme” or “severe” obesity.")
    ]
    
    
    func getData(catagory: String) -> Information {
        
        if catagory == "Underweight"{
            return information[0]
        }
        else if catagory == "Normal"{
            return information[1]
        }
        else if catagory == "Overweight"{
            return information[2]
        }
        else{
            return information[3]
        }
    }
}
