//
//  NetworkManager.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 16/4/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

final class NetworkManager: NetworkServiceProtocol {
    private let baseURL = URL(string: "https://api.themoviedb.org/3/movie")
    private let session = URLSession.shared
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzQxMTEwNzY2MmY3YWQwYTk5YmExNmQyMjc5MmZhZSIsIm5iZiI6MTc0NDYzMzQzNS42MDA5OTk4LCJzdWIiOiI2N2ZjZmU1Yjc2NWM1MjIyZjM5OTU4MzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aJ8JHEOptywVlzr5BhniPxcCXX-HypR-BL8hp0JLafU"
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
        guard let baseURL,
              var components = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false),
              let url = components.url
        else {
            throw NetworkError.badURL
        }
        
        components.queryItems = endpoint.queryItems
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        do {
            let (data, response) = try await session.data(for: request)


            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.unknown
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(T.self, from: data)
            default:
                throw NetworkError.serverError(httpResponse.statusCode)
            }
        }
    }
}
