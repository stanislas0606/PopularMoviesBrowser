//
//  MovieDetailView.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 15/4/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var viewModel: MovieDetailsViewModel
    
    init(movie: Movie) {
        self.movie = movie
        self.viewModel = MovieDetailsViewModel(movie: movie)
    }
    
    var body: some View {
        ScrollView {
            if !viewModel.details.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: movie.moviePosterPath)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 500)
                    .scaledToFit()
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.title)
                            .bold()
                        
                        Text("Release date: \(movie.releaseDate)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        StarRatingView(rating: movie.voteAverage / 2)
                            .padding(.vertical)
                        
                        Text("Description:")
                            .font(.headline)
                        
                        Text("\(viewModel.details[0].overview)")
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                    .padding(.horizontal)
                }
            }
            
        }
        .task {
            await viewModel.loadMovieDetails(for: movie.id)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailView(movie: MockMovies.sampleMovies[7])
}
