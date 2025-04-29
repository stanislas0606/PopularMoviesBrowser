//
//  NetworkConfig.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 29/4/25.
//

import Foundation

struct NetworkConfig {
    var token: String

    static var `default`: NetworkConfig {
        NetworkConfig(
            token: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzQxMTEwNzY2MmY3YWQwYTk5YmExNmQyMjc5MmZhZSIsIm5iZiI6MTc0NDYzMzQzNS42MDA5OTk4LCJzdWIiOiI2N2ZjZmU1Yjc2NWM1MjIyZjM5OTU4MzMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.aJ8JHEOptywVlzr5BhniPxcCXX-HypR-BL8hp0JLafU"
        )
    }
}
