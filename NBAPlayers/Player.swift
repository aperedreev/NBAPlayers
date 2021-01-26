//
//  Player.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import Foundation

struct Player {
    let firstName: String
    let lastName: String
    let team: Team
//    let teamName: String
    let position: String
    let height: String
    
    var fullName: String {
        firstName + " " + lastName
    }
}

