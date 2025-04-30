//
//  MovieAPI.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 29/4/25.
//

import Foundation
import Network

enum MovieAPI {
    static func popular() -> Resource<[Movie]> {
        Resource(
            request: URLRequest(path: "popular"),
            parse: Resource<MoviesListResponseModel<Movie>>.decodeJSON >>> {
                $0.results
            }
        )
    }
    static func movieDetails(_ id: Int) -> Resource<MovieDetails> {
        Resource(
            request: URLRequest(path: "\(id)"),
            parse: Resource.decodeJSON
        )
    }
}
