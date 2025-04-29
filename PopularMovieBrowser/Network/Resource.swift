//
//  Resource.swift
//  PopularMoviesBrowser
//
//  Created by Dima Vorona on 26.04.2025.
//  Copyright © 2025 TuneIn Inc. All rights reserved.
//

import Foundation

struct Resource<T> {
    let request: URLRequest
    let decoder: (Data, URLResponse) throws -> T
}

extension Resource where T: Decodable {
    static func decodeJSON(from data: Data, response: URLResponse) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}

enum MovieAPI {
    static func popular() -> Resource<[Movie]> {
        Resource(
            request: URLRequest(path: "popular"),
            decoder: Resource.decodeJSON
        )
    }
}

struct NetworkConfig {
    var token: String

    static var `default`: NetworkConfig {
        NetworkConfig(
            token: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzQxMTEwNzY2MmY3YWQwYTk5YmExNmQyMjc5MmZhZSIsIm5iZiI6MTc0NDYzMzQzNS42MDA5OTk4LCJzdWIiOiI2N2ZjZmU1Yjc2NWM1MjIyZjM5OTU4MzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aJ8JHEOptywVlzr5BhniPxcCXX-HypR-BL8hp0JLafU"
        )
    }
}

final class Network {
    let config: NetworkConfig
    let session: URLSession

    init(config: NetworkConfig, session: URLSession) {
        self.config = config
        self.session = session
    }

    func request<T>(_ resource: Resource<T>) async throws -> T {
        var request = resource.request
        request.setValue("Bearer \(config.token)", forHTTPHeaderField: "Authorization")
        let (data, response) = try await session.data(for: request)
        return try resource.decoder(data, response)
    }
}
