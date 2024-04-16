//
//  MoviesView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import SwiftUI

struct MoviesView: View {
    let store: StoreOf<MoviesCore>

    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: \.path)) {
            MoviesGridView(movies: store.movies)
                .navigationTitle(Texts.movies)
                .onAppear {
                    store.send(.fetchAllMovies)
                }
        } destination: { store in
            DetailsView(store: store)
        }
    }
}
