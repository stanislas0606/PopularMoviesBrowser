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
    private let networkManager: NetworkManager
    let movie: Movie
    var details: [MovieDetails] = []
    
    init(movie: Movie, networkManager: NetworkManager = NetworkManager.shared) {
        self.movie = movie
        self.networkManager = networkManager
    }
    
    func loadMovieDetails(for id: Int) async {
        do {
            //try await Task.sleep(until: .now + .seconds(1))
            let fetchedMovie = try await networkManager.fetchMovieDetail(for: movie.id)
            details.append(fetchedMovie)
        } catch {
            print(error.localizedDescription)
        }
    }
}
