//
//  WeatherForecastModel.swift
//  Health Care App
//
//  Created by Mac on 06/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//MARK: - WeatherForecastModel Model
struct WeatherForecastModel: Codable {
        let cod : String?
        let message : Int?
        let cnt : Int?
        let list : [List]?
        let city : City?

        enum CodingKeys: String, CodingKey {

            case cod = "cod"
            case message = "message"
            case cnt = "cnt"
            case list = "list"
            case city = "city"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            cod = try values.decodeIfPresent(String.self, forKey: .cod)
            message = try values.decodeIfPresent(Int.self, forKey: .message)
            cnt = try values.decodeIfPresent(Int.self, forKey: .cnt)
            list = try values.decodeIfPresent([List].self, forKey: .list)
            city = try values.decodeIfPresent(City.self, forKey: .city)
        }

    }
//MARK: - City Model
struct City : Codable {
    let id : Int?
    let name : String?
    let coord : Coord?
    let country : String?
    let population : Int?
    let timezone : Int?
    let sunrise : Int?
    let sunset : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case coord = "coord"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        population = try values.decodeIfPresent(Int.self, forKey: .population)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
    }

}
//MARK: - List Model
struct List : Codable {
    let dt : Int?
    let main : Main?
    let weather : [Weather]?
    let clouds : Clouds?
    let wind : Wind?
    let visibility : Int?
    let pop : Double?
    let rain : Rain?
    let sys : Sys?
    let dt_txt : String?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case pop = "pop"
        case rain = "rain"
        case sys = "sys"
        case dt_txt = "dt_txt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        pop = try values.decodeIfPresent(Double.self, forKey: .pop)
        rain = try values.decodeIfPresent(Rain.self, forKey: .rain)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt)
    }

}

