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
    private var movies: [Movie] = []
    private var isLoading = false
    
    var moviesIsEmpty: Bool {
        movies.isEmpty
    }
    
    var dataIsLoading: Bool {
        isLoading
    }
    
    var allMovies: [Movie] {
        movies
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
        do {
            //try await Task.sleep(until: .now + .seconds(1))
            let fetchedMovies = try await NetworkManager.shared.fetchMovieList()
            movies = fetchedMovies
            isLoading = false
        } catch {
            print(error.localizedDescription)
            isLoading = false
        }
    }
}
