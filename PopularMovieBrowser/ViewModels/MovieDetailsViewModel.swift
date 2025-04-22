//
//  MovieDetailsViewModel.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 18/4/25.
//

import Foundation
import Observation

@Observable
final class MovieDetailsViewModel {
    var movie: Movie
    var details: [MovieDetails] = []
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func loadMovieDetails(for id: Int) async {
        do {
            //try await Task.sleep(until: .now + .seconds(1))
            let fetchedMovie = try await NetworkManager.shared.fetchMovieDetail(for: movie.id)
            details.append(fetchedMovie)
        } catch {
            print(error.localizedDescription)
        }
    }
}
