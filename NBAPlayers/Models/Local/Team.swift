//
//  Team.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

struct Team {
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
