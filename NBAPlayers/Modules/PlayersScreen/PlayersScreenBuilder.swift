//
//  PlayersScreenBuilder.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 16.07.2021.
//

import Foundation

struct PlayersScreenBuilder {
    
    typealias SectionType = PlayersScreenDataSource.SectionType
    
    static func build() -> [SectionType] {
        
        var sections = [SectionType]()
        var items = [PlayersScreenItem]()
        
        return sections
    }
}
