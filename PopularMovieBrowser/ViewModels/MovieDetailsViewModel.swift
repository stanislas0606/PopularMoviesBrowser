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
        
        let endpoint = Endpoint(path: "\(id)")
        do {
            //try await Task.sleep(until: .now + .seconds(1))
            let fetchedMovie: MovieDetails = try await networkManager.request(endpoint)
            details.append(fetchedMovie)
        } catch {
            print(error.localizedDescription)
        }
    }
}
