//
//  ServerResponse.swift
//  NBAPlayers
//
//  Created by Alex Peredreev on 13.07.2021.
//

import Foundation

struct ServerArrayResponse<T: Decodable>: Decodable {
    let data: [T]?
    let statusCode: Int?
}

struct ServerResponse<T: Decodable>: Decodable {
    let data: T
    let statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case data
        case statusCode
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode  = try? values.decode(Int?.self, forKey: .statusCode)

        self.data = try values.decode(T.self, forKey: .data)
    }

}
