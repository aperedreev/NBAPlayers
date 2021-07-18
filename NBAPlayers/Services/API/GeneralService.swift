//
//  GeneralService.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

enum ApiError: Error {
    case noData
    case badRequest
    case refresh
}

struct GeneralService {
    
    let provider = MasterProvider<GeneralAPI>()

}

extension GeneralService {
    
    func fetchPlayers(page: Int, limit: Int) -> Observable<[Player]> {
        
        provider.rx.request(.fetchPlayers(page: page, limit: limit))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ServerResponse<[ServerPlayer]>.self)
            .map { PlayerMapper().toLocal(list: $0.data) }
            .asObservable()
    }
    
    func fetchTeams() -> Observable<[Team]> {
        
        provider.rx.request(.fetchTeams)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ServerResponse<[ServerTeam]>.self)
            .map { TeamMapper().toLocal(list: $0.data) }
            .asObservable()
    }
    
    func fetchGames(page: Int, limit: Int) -> Observable<[Game]> {
        
        provider.rx.request(.fetchGames(page: page, limit: limit))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ServerResponse<[ServerGame]>.self)
            .map { GameMapper().toLocal(list: $0.data) }
            .asObservable()
        
    }
    
}
