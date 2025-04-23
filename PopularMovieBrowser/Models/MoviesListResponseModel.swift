//
//  MoviesListResponceModel.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 18/4/25.
//

import Foundation

struct MovieListResponseModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
}
