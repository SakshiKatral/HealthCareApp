//
//  City Data Model.swift
//  Health Care App
//
//  Created by Mac on 27/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct DistrictDataModel : Codable {
    let notes : String?
    let active : Int?
    let confirmed : Int?
    let deceased : Int?
    let recovered : Int?
    let delta : Delta?
    
    enum CodingKeys: String, CodingKey {
        
        case notes = "notes"
        case active = "active"
        case confirmed = "confirmed"
        case deceased = "deceased"
        case recovered = "recovered"
        case delta = "delta"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        notes = try values.decodeIfPresent(String.self, forKey: .notes)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        confirmed = try values.decodeIfPresent(Int.self, forKey: .confirmed)
        deceased = try values.decodeIfPresent(Int.self, forKey: .deceased)
        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered)
        delta = try values.decodeIfPresent(Delta.self, forKey: .delta)
    }
    
}
struct Delta : Codable {
    let confirmed : Int?
    let deceased : Int?
    let recovered : Int?

    enum CodingKeys: String, CodingKey {

        case confirmed = "confirmed"
        case deceased = "deceased"
        case recovered = "recovered"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        confirmed = try values.decodeIfPresent(Int.self, forKey: .confirmed)
        deceased = try values.decodeIfPresent(Int.self, forKey: .deceased)
        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered)
    }

}


