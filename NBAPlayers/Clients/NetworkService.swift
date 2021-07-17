//
//  NetworkService.swift
//  NBAPlayers
//
//  Created by A L E X on 08.05.2021.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> ())
}

class NetworkService: Networking {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        let dataTask = createDataTask(with: urlRequest, completion: completion)
        dataTask.resume()
    }

    private func createDataTask(with request: URLRequest, completion: @escaping (Data?, Error?) -> ()) -> URLSessionDataTask {
        let session = URLSession.shared
        
        return session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    
    }
}
