//
//  ContentView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
    @Bindable var store: StoreOf<HomeCore>
    
    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: \.path)) {
            if store.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    if !store.searchText.isEmpty {
                        if store.isSearchLoading {
                            ProgressView()
                        } else {
                            MoviesGridView(movies: store.foundMovies)
                        }
                    } else {
                        VStack {
                            MoviesCategoryRow(categoryName: Texts.trendingMovies, movies: store.trendingMovies)
                            MoviesCategoryRow(categoryName: Texts.popularMovies, movies: store.popularMovies)
                            MoviesCategoryRow(categoryName: Texts.trendingTVShows, movies: store.trendingTVShows)
                            MoviesCategoryRow(categoryName: Texts.popularTVShows, movies: store.popularTVShows)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .navigationTitle(Texts.moviesTVShows)
            }
        } destination: { store in
            DetailsView(store: store)
        }
        .searchable(text: $store.searchText.sending(\.setSearchResult))
        .onAppear {
            store.send(.fetchAllData)
        }
        
        
    }
}
