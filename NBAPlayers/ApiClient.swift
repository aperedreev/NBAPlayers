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
}

class ApiClientImpl: ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> ()) {
        let session = URLSession.shared
        
        let url = URL(string: "https://www.balldontlie.io/api/v1/players")!
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            
// LOADING AND ERROR TESTING
//            sleep(5)
//            completion(.failure(ApiError.noData))
//            return
            
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
}
