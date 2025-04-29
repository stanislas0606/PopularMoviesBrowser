//
//  Movie.swift
//  PopularMovieBrowser
//
//  Created by Stanislav Vorozhtsov on 14/4/25.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String
    let voteAverage: Double
    
    var moviePosterPath: String {
        "https://image.tmdb.org/t/p/w500/" + posterPath
    }
}
