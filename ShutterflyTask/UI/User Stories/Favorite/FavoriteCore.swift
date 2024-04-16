//
//  FavoriteCore.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture

@Reducer
struct FavoritesCore {
    @ObservableState
    struct State: Equatable {
        var path = StackState<DetailsCore.State>()
        var favoriteList: [EntertainmentDetailsBundle]?
    }
    
    enum Action {
        case path(StackAction<DetailsCore.State, DetailsCore.Action>)
        case getFavoritesList
        case listResponse([EntertainmentDetailsBundle])
    }
    
    @Dependency(\.favoritesRepository) private var favoritesRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .getFavoritesList:
                return .run { send in
                    await send(.listResponse(favoritesRepository.getFavorites()))
                }
            case .listResponse(let favoritesList):
                state.favoriteList = favoritesList
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            DetailsCore()
        }
    }
}
