//
//  ServerGame.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

struct ServerGame: Decodable {
    let homeTeam: ServerTeam?
    let awayTeam: ServerTeam?

    let homeTeamScore: Int?
    let awayTeamScore: Int?
    let dateGet: String?
    
    let season: Int?
    let period: Int?
    let status: String?
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case homeTeam      = "home_team"
        case awayTeam      = "visitor_team"
        case homeTeamScore = "home_team_score"
        case awayTeamScore = "visitor_team_score"
        case dateGet       = "date"
        case season
        case period
        case status
        case time
    }
}
