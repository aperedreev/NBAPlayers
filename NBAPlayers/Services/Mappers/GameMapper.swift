//
//  GameMapper.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 18.07.2021.
//

import Foundation

final class GameMapper: BaseModelMapper<ServerGame, Game> {
    
    let teamMapper = TeamMapper()
    
    override func toLocal(serverEntity: ServerGame) -> Game {
        
        let model = Game(homeTeam: teamMapper
                            .toLocal(serverEntity: serverEntity.homeTeam ?? ServerTeam(id: 0,
                                                                                       city: "",
                                                                                       abbreviation: "",
                                                                                       name: "Unknown Team",
                                                                                       conference: "",
                                                                                       division: "")),
                         awayTeam: teamMapper
                            .toLocal(serverEntity: serverEntity.awayTeam ?? ServerTeam(id: 0,
                                                                                       city: "",
                                                                                       abbreviation: "",
                                                                                       name: "Unknown Team",
                                                                                       conference: "",
                                                                                       division: "")),
                         homeTeamScore: serverEntity.homeTeamScore ?? 0,
                         awayTeamScore: serverEntity.awayTeamScore ?? 0,
                         dateGet: serverEntity.dateGet ?? "",
                         season: serverEntity.season ?? 0,
                         period: serverEntity.period ?? 0,
                         status: serverEntity.status ?? "",
                         time: serverEntity.time ?? "")
        
        return model
    }
}
