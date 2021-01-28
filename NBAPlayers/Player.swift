//
//  Player.swift
//  NBAPlayers
//
//  Created by A L E X on 26.01.2021.
//

import Foundation

struct PlayersResponse: Decodable {
    let data: [Player]
}

struct Player: Decodable {
    let firstName: String
    let lastName: String

    let position: String
    let team: Team
    
    let heightFeet: Int?
    let heightInches: Int?
    
    var height: String {
        if let heightFeet = heightFeet, let heightInches = heightInches {
            return "\(heightFeet)'\(heightInches)''"
        } else {
            return "Unknown"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case position = "position"
        case team = "team"
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
}

