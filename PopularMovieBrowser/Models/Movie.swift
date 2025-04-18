//
//  Movie.swift
//  PopularMovieBrowser
//
//  Created by Stanislav Vorozhtsov on 14/4/25.
//

import Foundation

struct MovieListResponceModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double
    
    var moviePosterPath: String {
        "https://image.tmdb.org/t/p/w500/" + posterPath
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

struct MovieDetails: Codable {
    
}
