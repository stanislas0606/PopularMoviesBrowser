//
//  NetworkConfig.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 29/4/25.
//

import Foundation

public struct NetworkConfig {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    public var baseURL: String
    var token: String

    public static var `default`: NetworkConfig {
        NetworkConfig(
            baseURL: "https://api.themoviedb.org/3/movie", 
            token: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzQxMTEwNzY2MmY3YWQwYTk5YmExNmQyMjc5MmZhZSIsIm5iZiI6MTc0NDYzMzQzNS42MDA5OTk4LCJzdWIiOiI2N2ZjZmU1Yjc2NWM1MjIyZjM5OTU4MzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aJ8JHEOptywVlzr5BhniPxcCXX-HypR-BL8hp0JLafU"
        )
    }
}
