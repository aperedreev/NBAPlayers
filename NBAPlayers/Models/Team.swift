//
//  Team.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import Foundation

struct TeamsResponse: Decodable {
    let data: [Team]
}

struct Team: Decodable {
    let id: Int
    let city: String
    let abbreviation: String
    let name: String
    let conference: String
    let division: String
    
    var fullTeamName: String {
        city + " " + name
    }
}

enum CodingKeys: String, CodingKey {
    case id = "id"
    case city = "city"
    case abbreviation = "abbreviation"
    case name = "name"
    case conference = "conference"
    case division = "division"
}
