//
//  BMI.swift
//  BMI Calculator App
//
//  Created by Mac on 12/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

struct BMI {
    let value : Float
    let catagory : String
    let color : UIColor
    init(value: Float, catagory: String, color: UIColor) {
        self.value = value
        self.catagory = catagory
        self.color = color
    }
}
