//
//  MoviesGridView.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import ComposableArchitecture
import SwiftUI

struct MoviesGridView<T: EntertainmentContent>: View {
    let movies: IdentifiedArray<UUID, T>

    private let columns: [GridItem] = [
        .init(),
        .init()
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(movies) { movie in
                    MovieCell(movie: movie)
                }
            }
            .padding()
        }
    }
}
