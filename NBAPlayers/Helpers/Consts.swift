//
//  Consts.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

enum Consts {
    
    enum API {
        static let baseURL = URL(string: "https://www.balldontlie.io")!
        
        static let xContentTypeName = "Content-type"
        static let xContentTypeValue = "application/json"
        static let authVerbose = true
        static let backendVerbose = true
    }
}
