//
//  NetworkError.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 24/4/25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case decodingError
    case serverError(Int)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badURL: "Invalid URL."
        case .decodingError: "Failed to decode responce."
        case .serverError(let code): "Server error: \(code)"
        case .unknown: "Unknown error."
        }
    }
}
