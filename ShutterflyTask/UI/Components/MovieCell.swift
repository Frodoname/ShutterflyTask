//
//  MovieCell.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Kingfisher
import SwiftUI

struct MovieCell<T: EntertainmentContent>: View {
    let movie: T
    
    var body: some View {
        KFImage(movie.image)
            .placeholder { _ in
                ProgressView()
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .cornerRadius(8)
            .overlay(alignment: .bottomLeading) {
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 8))
            }
    }
}
