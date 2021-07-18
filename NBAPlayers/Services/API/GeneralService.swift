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
    
    func fetchPlayers() -> Observable<[Player]> {
        
        provider.rx.request(.fetchPlayers(page: 29, limit: 100))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ServerResponse<[ServerPlayer]>.self)
//            .map(ServerPlayer.self)
            .map { PlayerMapper().toLocal(list: $0.data) }
            .asObservable()
        
    }
}
