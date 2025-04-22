//
//  NetworkManager.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 16/4/25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMovieList() async throws -> [Movie] {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzQxMTEwNzY2MmY3YWQwYTk5YmExNmQyMjc5MmZhZSIsIm5iZiI6MTc0NDYzMzQzNS42MDA5OTk4LCJzdWIiOiI2N2ZjZmU1Yjc2NWM1MjIyZjM5OTU4MzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aJ8JHEOptywVlzr5BhniPxcCXX-HypR-BL8hp0JLafU"
        ]
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let responceResult = try decoder.decode(MovieListResponceModel.self, from: data)
            return responceResult.results
        } catch {
            throw(error)
        }
    }
    
    func fetchMovieDetail(for id: Int) async throws -> MovieDetails {
        let url = URL(string: "https:/api.themoviedb.org/3/movie/\(id)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzQxMTEwNzY2MmY3YWQwYTk5YmExNmQyMjc5MmZhZSIsIm5iZiI6MTc0NDYzMzQzNS42MDA5OTk4LCJzdWIiOiI2N2ZjZmU1Yjc2NWM1MjIyZjM5OTU4MzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aJ8JHEOptywVlzr5BhniPxcCXX-HypR-BL8hp0JLafU"
        ]

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: UTF8.self))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(MovieDetails.self, from: data)
        } catch {
            throw(error)
        }
    }
}
