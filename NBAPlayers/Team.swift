//
//  Team.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import Foundation

struct Team: Decodable {
    let city: String
    let name: String
    let conference: String
    
    var fullTeamName: String {
        city + " " + name
    }
}

let lakers = Team(city: "Los Angeles", name: "Lakers", conference: "West")
let heat = Team(city: "Miami", name: "Heat", conference: "East")
