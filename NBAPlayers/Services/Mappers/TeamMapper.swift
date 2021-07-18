//
//  TeamMapper.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

final class TeamMapper: BaseModelMapper<ServerTeam, Team> {
    
    override func toLocal(serverEntity: ServerTeam) -> Team {
        
        let model = Team(id: serverEntity.id ?? 0,
                         city: serverEntity.city ?? "",
                         abbreviation: serverEntity.abbreviation ?? "",
                         name: serverEntity.name ?? "",
                         conference: serverEntity.conference ?? "",
                         division: serverEntity.division ?? "")
        
        return model
    }
}
