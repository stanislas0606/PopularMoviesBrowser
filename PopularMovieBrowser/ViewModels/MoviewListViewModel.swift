//
//  MoviewListViewModel.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 14/4/25.
//

import Foundation
import Observation

@Observable
class MoviewListViewModel: ObservableObject {
    var movies: [Movie] = []
    var isLoading = false
    
    func loadMockData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.movies = MockMovies.sampleMovies
            self.isLoading = false
        }
    }
    
    func loadMovieList() async {
        print("isLoading")
        isLoading = true
        do {
            //try await Task.sleep(until: .now + .seconds(1))
            let fetchedMovies = try await NetworkManager.shared.fetchMovieList()
            movies = fetchedMovies
            isLoading = false
        } catch {
            print(error.localizedDescription)
        }
    }
}
