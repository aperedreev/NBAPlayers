//
//  ServerPlayer.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation

struct ServerPlayer: Decodable {
    let firstName: String?
    let lastName: String?

    let position: String?
    let team: Team?
    
    let heightFeet: Int?
    let heightInches: Int?
    
    let weightInPounds: Int?
    
    enum CodingKeys: String, CodingKey {
        case firstName      = "first_name"
        case lastName       = "last_name"
        case position
        case team
        case heightFeet     = "height_feet"
        case heightInches   = "height_inches"
        case weightInPounds = "weight_pounds"
    }
    
}
