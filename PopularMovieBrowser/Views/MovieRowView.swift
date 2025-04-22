//
//  MovieRowView.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 14/4/25.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: movie.moviePosterPath)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 80, height: 120)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                Text("Year: \(String(movie.releaseDate.prefix(4)))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                StarRatingView(rating: movie.voteAverage / 2)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MovieRowView(movie: MockMovies.sampleMovies[0])
}
