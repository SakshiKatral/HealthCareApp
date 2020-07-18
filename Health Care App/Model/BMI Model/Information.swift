//
//  Information.swift
//  BMI Calculator App
//
//  Created by Mac on 15/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct Information{
    var image : String
    var catagory : String
    var details : String
    init(image: String, catagory: String, details: String) {
        self.image = image
        self.catagory = catagory
        self.details = details
    }
}
