//
//  Game.swift
//  NBAPlayers
//
//  Created by A L E X on 31.01.2021.
//

import Foundation

struct GamesResponse: Decodable {
    let data: [_Game]
}

struct _Game: Decodable {
    let homeTeam: _Team
    let awayTeam: _Team

    let homeTeamScore: Int?
    let awayTeamScore: Int?
    let dateGet:       String
    var date:          String {
        String(dateGet.split(separator: "T")[0])
    }
    let season: Int?
    let period: Int?
    let status: String
    let time:   String?
    
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


