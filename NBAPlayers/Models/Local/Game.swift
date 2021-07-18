//
//  Game.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

struct Game {
    let homeTeam: Team
    let awayTeam: Team

    let homeTeamScore: Int
    let awayTeamScore: Int
    let dateGet:       String
    
    var date:          String {
        String(dateGet.split(separator: "T")[0])
    }
    
    let season: Int
    let period: Int
    let status: String
    let time:   String
}
