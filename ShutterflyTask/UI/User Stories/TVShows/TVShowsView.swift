//
//  TVShowsView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import SwiftUI

struct TVShowsView: View {
    let store: StoreOf<TVShowsCore>

    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: \.path)) {
            MoviesGridView(movies: store.tvShows)
                .navigationTitle(Texts.tvShows)
                .onAppear {
                    store.send(.fetchAllTVShows)
                }
        } destination: { store in
            DetailsView(store: store)
        }
    }
}
