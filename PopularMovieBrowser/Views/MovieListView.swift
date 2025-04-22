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
            // ?
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.movies) { movie in
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
                if viewModel.movies.isEmpty {
                    viewModel.loadMockData()
                }
            }*/
            .task {
                if viewModel.movies.isEmpty {
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
