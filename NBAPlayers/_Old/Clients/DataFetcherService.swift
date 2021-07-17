//
//  DataFetcherService.swift
//  NBAPlayers
//
//  Created by A L E X on 09.05.2021.
//

import Foundation

class DataFetcherService {
    
    let dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchPlayers(completion: @escaping (Result<[_Player]?, Error>) -> ()) {
        let urlPlayers = "https://www.balldontlie.io/api/v1/players?page=29&per_page=100"
        dataFetcher.fetchGenericJSONData(urlString: urlPlayers, response: completion)
    }
    
    func fetchTeams(completion: @escaping (Result<[Team]?, Error>) -> ()) {
        let urlTeams = "https://www.balldontlie.io/api/v1/teams"
        dataFetcher.fetchGenericJSONData(urlString: urlTeams, response: completion)
    }
    
    func fetchGames(completion: @escaping (Result<[Game]?, Error>) -> ()) {
        let urlGames = "https://www.balldontlie.io/api/v1/games?page=1230&per_page=40"
        dataFetcher.fetchGenericJSONData(urlString: urlGames, response: completion)
    }
}
