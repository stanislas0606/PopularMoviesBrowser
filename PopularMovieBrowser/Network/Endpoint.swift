//
//  Endpoint.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 24/4/25.
//

import Foundation

struct Endpoint {
    let path: String
    let method: HTTPMethod
    let queryItems: [URLQueryItem]?
    let body: Data?
    let headers: [String: String]?
    
    init(
        path: String,
        method: HTTPMethod = .get,
        queryItems: [URLQueryItem]? = nil,
        body: Encodable? = nil,
        headers: [String: String]? = nil
    ) {
        self.path = path
        self.method = method
        self.queryItems = queryItems
        self.headers = headers
        
        if let body {
            self.body = try? JSONEncoder().encode(body)
        } else {
            self.body = nil
        }
    }
}
