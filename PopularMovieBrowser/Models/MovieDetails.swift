//
//  MovieDetails.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 18/4/25.
//

import Foundation

struct MovieDetails: Codable, Identifiable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Double
    let overview: String
    
    var moviePosterPath: String {
        "https://image.tmdb.org/t/p/w500/" + posterPath
    }
    
    var movieBackdropPath: String {
        "https://image.tmdb.org/t/p/w500/" + backdropPath
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
        case overview
    }
}
