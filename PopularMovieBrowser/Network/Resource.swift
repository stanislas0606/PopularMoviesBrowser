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
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}




