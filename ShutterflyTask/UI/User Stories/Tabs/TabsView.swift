//
//  TabsView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import SwiftUI

struct TabsView: View {
    let store: StoreOf<TabsCore>
    
    var body: some View {
        TabView {
            HomeView(store: store.scope(state: \.home, action: \.home))
                .tabItem {
                    Label(Texts.home, systemImage: "house")
                }
            MoviesView(store: store.scope(state: \.movies, action: \.movies))
                .tabItem {
                    Label(Texts.movies, systemImage: "popcorn")
                }
            TVShowsView(store: store.scope(state: \.tvShows, action: \.tvShows))
                .tabItem {
                    Label(Texts.tvShows, systemImage: "tv")
                }
            FavouritesView(store: store.scope(state: \.favourite, action: \.favourite))
                .tabItem {
                    Label(Texts.favorite, systemImage: "star.fill")
                }
        }
    }
}
