//
//  MoviewListViewModel.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 14/4/25.
//

import Foundation
import Observation

@Observable
final class MoviesListViewModel {
    private let networkManager: NetworkManager
    private(set) var movies: [Movie] = []
    private(set) var isLoading = false
    
    init(networkManager: NetworkManager = NetworkManager.shared) {
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
            //try await Task.sleep(until: .now + .seconds(1))
            let endpoint = Endpoint(path: "popular")
            let response: ListResponseModel<Movie> = try await networkManager.request(endpoint)
            let fetchedMovies = response.results
            movies = fetchedMovies
        } catch {
            print(error.localizedDescription)
        }
    }
}
