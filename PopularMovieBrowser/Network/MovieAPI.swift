//
//  MovieAPI.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 29/4/25.
//

import Foundation

enum MovieAPI {
    static func popular() -> Resource<MoviesListResponseModel<Movie>> {
        Resource(
            request: URLRequest(path: "popular"),
            decoder: Resource.decodeJSON
        )
    }
    static func movieDetails(_ id: Int) -> Resource<MovieDetails> {
        Resource(
            request: URLRequest(path: "\(id)"),
            decoder: Resource.decodeJSON)
    }
}
