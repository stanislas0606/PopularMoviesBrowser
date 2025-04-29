//
//  MovieListView.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 15/4/25.
//

import SwiftUI

struct MovieListView: View {
    @State private var viewModel = MoviesListViewModel()
    
    var body: some View {
        NavigationSplitView {
            Group {
                if viewModel.dataIsLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.allMovies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRowView(movie: movie)
                        }
                        .listRowSeparator(.visible)
                        .listRowBackground(Color(.secondarySystemBackground))
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Popular movies")
            /*
            .onAppear {
                if viewModel.moviesIsEmpty {
                    viewModel.loadMockData()
                }
            }*/
            .task {
                if viewModel.moviesIsEmpty {
                    await viewModel.loadMovieList()
                }
            }
        } detail: {
            Text("Select a movie")
        }
    }
}

#Preview {
    MovieListView()
}
