//
//  Country List.swift
//  Health Care App
//
//  Created by Mac on 22/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct CountryList : Codable{
    var country : String?
    var slug : String?
    var iSO2 : String?
    enum CodingKeys: String, CodingKey {
        case slug = "Slug"
        case country = "Country"
        case iSO2 = "ISO2"
    }
    
    init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    slug = try values.decodeIfPresent(String.self, forKey: .slug)
    country = try values.decodeIfPresent(String.self, forKey: .country)
    iSO2 = try values.decodeIfPresent(String.self, forKey: .iSO2)
        

}
}
struct CountryName{
    var country : String
    var slug : String
    var iSO2 : String
    init(country: String, slug: String, iSO2: String){
        self.country = country
        self.iSO2 = iSO2
        self.slug = slug
    }
    
}
