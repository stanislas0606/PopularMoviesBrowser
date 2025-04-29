//
//  NetworkManager.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 16/4/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T>(_ resource: Resource<T>) async throws -> T
}

final class NetworkManager: NetworkServiceProtocol {
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
