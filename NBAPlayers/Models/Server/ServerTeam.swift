//
//  ServerTeam.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

struct ServerTeam: Decodable {
    let id: Int?
    let city: String?
    let abbreviation: String?
    let name: String?
    let conference: String?
    let division: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case city = "city"
        case abbreviation = "abbreviation"
        case name = "name"
        case conference
        case division = "division"
    }
}

