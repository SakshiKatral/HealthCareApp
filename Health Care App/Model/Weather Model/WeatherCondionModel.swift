//
//  WeatherCondionModel.swift
//  Health Care App
//
//  Created by Mac on 06/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct WeatherConditionModel {
    let conditionID : Int
    let cityName : String
    let temparature : Double
    var temparatureString : String{
        return String(format: "%.1f", temparature)
    }
    
    var condtionName : String
    {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud.sun"
        }
    }
}
