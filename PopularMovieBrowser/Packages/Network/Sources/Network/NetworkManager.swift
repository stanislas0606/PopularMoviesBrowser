//
//  NetworkManager.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 16/4/25.
//

import Foundation

public protocol NetworkServiceProtocol {
    func request<T>(_ resource: Resource<T>) async throws -> T
}

public final class NetworkManager: NetworkServiceProtocol {
    let config: NetworkConfig
    let session: URLSession

    public init(config: NetworkConfig, session: URLSession) {
        self.config = config
        self.session = session
    }

    public func request<T>(_ resource: Resource<T>) async throws -> T {
        var request = resource.request
        request.setValue("Bearer \(config.token)", forHTTPHeaderField: "Authorization")
        let (data, response) = try await session.data(for: request)
        return try resource.parse(data, response)
    }
}
