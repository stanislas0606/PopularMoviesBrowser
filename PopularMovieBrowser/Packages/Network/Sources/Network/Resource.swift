//
//  Resource.swift
//  PopularMoviesBrowser
//
//  Created by Dima Vorona on 26.04.2025.
//  Copyright © 2025 TuneIn Inc. All rights reserved.
//

import Foundation

public struct Resource<T> {
    let request: URLRequest
    let parse: (Data, URLResponse) throws -> T
    
    public init(request: URLRequest, parse: @escaping (Data, URLResponse) throws -> T) {
        self.request = request
        self.parse = parse
    }
}

extension Resource where T: Decodable {
    public static func decodeJSON(from data: Data, response: URLResponse) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}




