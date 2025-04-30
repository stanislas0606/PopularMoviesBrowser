//
//  MoviewListViewModel.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 14/4/25.
//

import Foundation
import Observation
import Network

@Observable
final class MoviesListViewModel {
    private let networkManager: NetworkServiceProtocol
    private(set) var movies: [Movie] = []
    private(set) var isLoading = false
    
    init(networkManager: NetworkServiceProtocol = NetworkManager(config: .default, session: .shared)) {
        self.networkManager = networkManager
    }
    
    func loadMockData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.movies = MockMovies.sampleMovies
            self.isLoading = false
        }
    }
    
    func loadMovieList() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let fetchedMovies = try await networkManager.request(MovieAPI.popular())
            movies = fetchedMovies
        } catch {
            print(error.localizedDescription)
        }
    }
}
