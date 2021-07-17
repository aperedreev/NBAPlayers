//
//  Player.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation

struct Player {
    let firstName: String
    let lastName: String

    let position: String
    let team: Team
    
    let heightFeet: Int?
    let heightInches: Int?
    
    var height: String {
        if let heightFeet = heightFeet, let heightInches = heightInches {
            return "\(heightFeet)'\(heightInches)\""
        } else {
            return "Unknown"
        }
    }
    
    let weightInPounds: Int?
    
    var weight: String {
        if let weightInPounds = weightInPounds {
            return "\(weightInPounds) lbs"
        } else {
            return "Unknown"
        }
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
}
