//
//  MoviesListResponceModel.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 18/4/25.
//

import Foundation

struct MoviesListResponseModel<T: Decodable>: Decodable {
    let page: Int
    let results: [T]
    let totalPages: Int
    let totalResults: Int
}
