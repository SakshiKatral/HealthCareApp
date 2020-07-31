//
//  State Data Model.swift
//  Health Care App
//
//  Created by Mac on 27/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
//struct StateDataModel : Codable {
//    let statewise : [Statewise]?
//    enum CodingKeys: String, CodingKey {
//        case statewise = "statewise"
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        statewise = try values.decodeIfPresent([Statewise].self, forKey: .statewise)
//    }
//}
//
//struct Statewise : Codable {
//        let active : String?
//        let confirmed : String?
//        let deaths : String?
//        let deltaconfirmed : String?
//        let deltadeaths : String?
//        let deltarecovered : String?
//        let lastupdatedtime : String?
//        let migratedother : String?
//        let recovered : String?
//        let state : String?
//        let statecode : String?
//        let statenotes : String?
//
//        enum CodingKeys: String, CodingKey {
//
//            case active = "active"
//            case confirmed = "confirmed"
//            case deaths = "deaths"
//            case deltaconfirmed = "deltaconfirmed"
//            case deltadeaths = "deltadeaths"
//            case deltarecovered = "deltarecovered"
//            case lastupdatedtime = "lastupdatedtime"
//            case migratedother = "migratedother"
//            case recovered = "recovered"
//            case state = "state"
//            case statecode = "statecode"
//            case statenotes = "statenotes"
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            active = try values.decodeIfPresent(String.self, forKey: .active)
//            confirmed = try values.decodeIfPresent(String.self, forKey: .confirmed)
//            deaths = try values.decodeIfPresent(String.self, forKey: .deaths)
//            deltaconfirmed = try values.decodeIfPresent(String.self, forKey: .deltaconfirmed)
//            deltadeaths = try values.decodeIfPresent(String.self, forKey: .deltadeaths)
//            deltarecovered = try values.decodeIfPresent(String.self, forKey: .deltarecovered)
//            lastupdatedtime = try values.decodeIfPresent(String.self, forKey: .lastupdatedtime)
//            migratedother = try values.decodeIfPresent(String.self, forKey: .migratedother)
//            recovered = try values.decodeIfPresent(String.self, forKey: .recovered)
//            state = try values.decodeIfPresent(String.self, forKey: .state)
//            statecode = try values.decodeIfPresent(String.self, forKey: .statecode)
//            statenotes = try values.decodeIfPresent(String.self, forKey: .statenotes)
//        }
//}
struct StateData {
    let active : String
    let confirmed : String
    let deaths : String
    let deltaconfirmed : String
    let deltadeaths : String
    let deltarecovered : String
    let lastupdatedtime : String
    let migratedother : String
    let recovered : String
    let state : String
    let statecode : String
    let statenotes : String
    init(statecode: String, state: String, active: String, confirmed: String, recovered: String,deaths: String,statenotes: String, deltaconfirmed: String , deltadeaths: String, deltarecovered: String, lastupdatedtime: String, migratedother: String) {

        self.state = state
        self.active = active
        self.confirmed = confirmed
        self.recovered = recovered
        self.deaths = deaths
        self.deltadeaths = deltadeaths
        self.deltaconfirmed = deltaconfirmed
        self.deltarecovered = deltarecovered
        self.lastupdatedtime = lastupdatedtime
        self.migratedother = migratedother
        self.statecode = statecode
        self.statenotes = statenotes
    }
}
//
