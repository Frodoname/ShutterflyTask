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
            Group {
                if store.isLoading {
                    ProgressView()
                } else {
                    MoviesGridView(movies: store.movies)
                        .navigationTitle(Texts.movies)
                        .toolbar {
                            Menu(Texts.sort) {
                                Button(Texts.topRated) {
                                    store.send(.sortMovies(.topRated))
                                }
                                Button(Texts.nowPlaying) {
                                    store.send(.sortMovies(.nowPlaying))
                                }
                                Button(Texts.popular) {
                                    store.send(.sortMovies(.popular))
                                }
                            }
                        }
                }
            }
            .onAppear {
                store.send(.fetchAllMovies)
            }
        } destination: { store in
            DetailsView(store: store)
        }
    }
}
