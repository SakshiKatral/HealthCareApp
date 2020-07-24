//
//  Country List.swift
//  Health Care App
//
//  Created by Mac on 22/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct CountryList : Codable{
    var alpha2Code : String?
    var name : String?
    enum CodingKeys: String, CodingKey {
        case alpha2Code = "alpha2Code"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    alpha2Code = try values.decodeIfPresent(String.self, forKey: .alpha2Code)
    name = try values.decodeIfPresent(String.self, forKey: .name)

}
}
struct CountryName{
    var alpha2Code : String
    var name : String
    init(name: String, alpha2Code: String){
        self.name = name
        self.alpha2Code = alpha2Code
    }
    
}
