//
//  MovieDetailView.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 15/4/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
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
                    
                    Text("Some description from API")
                        .font(.body)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailView(movie: MockMovies.sampleMovies[7])
}
