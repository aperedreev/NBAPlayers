//
//  GeneralAPI.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation
import Moya

enum GeneralAPI {
    case fetchPlayers(page: Int, limit: Int)
}

extension GeneralAPI: TargetType {
    var baseURL: URL {
        return Consts.API.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchPlayers:
            return "/api/v1/players"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPlayers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var params = [String: Any]()
        
        switch self {
        case let .fetchPlayers(page: page, limit: limit):
            params["page"] = page
            params["per_page"] = limit
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
