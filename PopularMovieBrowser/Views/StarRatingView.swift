//
//  StarRatingView.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 15/4/25.
//

import SwiftUI

struct StarRatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rating.rounded()) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 3)
}
