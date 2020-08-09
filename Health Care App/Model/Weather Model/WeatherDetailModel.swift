//
//  WeatherDetailModel.swift
//  Health Care App
//
//  Created by Mac on 06/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//MARK:- WeatherDetail Model
struct WeatherDetailModel {
    var description : String
    var pressure : Int
    var humidity : Int
    var temp_min : Double
    var temp_max : Double
    var speed : Double
    var deg : Int
    var temparature : Double
    var name : String
}
//MARK:- WeatherForecastDetail Model
struct WeatherForecastDetailModel {
    var description : String
    var pressure : Int
    var humidity : Int
    var temp_min : Double
    var temp_max : Double
    var speed : Double
    var deg : Int
    var temparature : Double
    var name : String
    var date : String
}
