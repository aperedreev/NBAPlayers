//
//  NetworkDataFetcher.swift
//  NBAPlayers
//
//  Created by A L E X on 08.05.2021.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (Result<T?, Error>) -> ())
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (Result<T?, Error>) -> ()) {
        networking.request(urlString: urlString) { data, error in
            if let error = error {
                print("Error receiving requesting data: \(error.localizedDescription)")
                response(.failure(ApiError.noData))
            }
            
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(.success(decoded))
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
     let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON:", jsonError)
            return nil
        }
    }
    
}
