//
//  Advice.swift
//  BMI Calculator App
//
//  Created by Mac on 15/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

struct Advice {
    var effect : String
    var yogaVideo : [String]
    var exerciseVideo : [String]
    var dietPlanVideo : [String]
    init(effect: String, yogaVideo: [String], exerciseVideo: [String],dietPlanVideo: [String]) {
        self.effect = effect
        self.yogaVideo = yogaVideo
        self.exerciseVideo = exerciseVideo
        self.dietPlanVideo = dietPlanVideo
    }
    
}
