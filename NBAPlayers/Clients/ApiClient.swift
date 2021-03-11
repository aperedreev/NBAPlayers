//
//  ApiClient.swift
//  NBAPlayers
//
//  Created by A L E X on 27.01.2021.
//

import Foundation

enum ApiError: Error {
    case noData
}

protocol ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> ())
    
    func getTeams(completion: @escaping (Result<[Team], Error>) -> ())
    
    func getGames(completion: @escaping (Result<[Game], Error>) -> ())
}

class ApiClientImpl: ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> ()) {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://www.balldontlie.io/api/v1/players?page=29&per_page=100") else { return }
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {data, response, error in

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PlayersResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                print(error)
                completion(.failure(error))
            }
        })
        
        dataTask.resume()
    }
    
    func getTeams(completion: @escaping (Result<[Team], Error>) -> ()) {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://www.balldontlie.io/api/v1/teams") else { return }
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(TeamsResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                print(error)
                completion(.failure(error))
            }
        })
        
        dataTask.resume()
    }
    
    func getGames(completion: @escaping (Result<[Game], Error>) -> ()) {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://www.balldontlie.io/api/v1/games?page=1230&per_page=40") else { return }
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(GamesResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                print(error)
                completion(.failure(error))
            }
        })
        
        dataTask.resume()
    }
}
