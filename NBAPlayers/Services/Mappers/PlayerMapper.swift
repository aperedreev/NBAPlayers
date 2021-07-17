//
//  PlayerMapper.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation

final class PlayerMapper: BaseModelMapper<ServerPlayer, Player> {
    
    override func toLocal(serverEntity: ServerPlayer) -> Player {
        
        let model = Player(firstName: serverEntity.firstName ?? "",
                           lastName: serverEntity.lastName ?? "",
                           position: serverEntity.position ?? "",
                           team: serverEntity.team ?? Team(id: 0,
                                                           city: "",
                                                           abbreviation: "",
                                                           name: "",
                                                           conference: "",
                                                           division: ""),
                           heightFeet: serverEntity.heightFeet,
                           heightInches: serverEntity.heightInches,
                           weightInPounds: serverEntity.weightInPounds)
        
        return model
    }
}
