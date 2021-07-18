//
//  PlayerMapper.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation

final class PlayerMapper: BaseModelMapper<ServerPlayer, Player> {
    
    let teamMapper = TeamMapper()
    
    override func toLocal(serverEntity: ServerPlayer) -> Player {
        
        let model = Player(firstName: serverEntity.firstName ?? "",
                           lastName: serverEntity.lastName ?? "",
                           position: serverEntity.position ?? "",
                           team: teamMapper
                            .toLocal(serverEntity: serverEntity.team ?? ServerTeam(id: 0,
                                                                              city: "",
                                                                              abbreviation: "",
                                                                              name: "Unknown Team",
                                                                              conference: "",
                                                                              division: "")),
                           heightFeet: serverEntity.heightFeet,
                           heightInches: serverEntity.heightInches,
                           weightInPounds: serverEntity.weightInPounds)
        
        return model
    }
}
