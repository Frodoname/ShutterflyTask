//
//  TabsCore.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture

@Reducer
struct TabsCore {
    struct State: Equatable {
        var home = HomeCore.State()
        var movies = MoviesCore.State()
        var tvShows = TVShowsCore.State()
        var favourite = FavoritesCore.State()
    }
    
    enum Action {
        case home(HomeCore.Action)
        case movies(MoviesCore.Action)
        case tvShows(TVShowsCore.Action)
        case favourite(FavoritesCore.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.home, action: \.home) {
            HomeCore()
        }
        Scope(state: \.movies, action: \.movies) {
            MoviesCore()
        }
        Scope(state: \.tvShows, action: \.tvShows) {
            TVShowsCore()
        }
        Scope(state: \.favourite, action: \.favourite) {
            FavoritesCore()
        }
    }
}
