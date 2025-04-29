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
    private let networkManager: NetworkServiceProtocol
    let movie: Movie
    private(set) var details: [MovieDetails] = []
    
    init(movie: Movie, networkManager: NetworkServiceProtocol = NetworkManager(config: .default, session: .shared)) {
        self.movie = movie
        self.networkManager = networkManager
    }
    
    func loadMovieDetails(for id: Int) async {
        do {
            let fetchedMovie: MovieDetails = try await networkManager.request(MovieAPI.movieDetails(id))
            details.append(fetchedMovie)
        } catch {
            print(error.localizedDescription)
        }
    }
}
