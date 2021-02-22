//
//  Team.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import Foundation

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
