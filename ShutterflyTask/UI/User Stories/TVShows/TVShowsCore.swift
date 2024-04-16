//
//  TVShowsCore.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture

@Reducer
struct TVShowsCore {
    @ObservableState
    struct State: Equatable {
        var tvShows: IdentifiedArrayOf<TVShow> = []
        var pagination = PaginationData()
        var isLoading = false
    }
    
    enum Action {
        case fetchAllTVShows
        case tvShowsResponse(Result<[TVShow], Error>)
    }
    
    @Dependency(\.tvShowsRepository) private var tvShowsRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAllTVShows:
                state.isLoading = true
                return .run { [pagination = state.pagination] send in
                    let result = await tvShowsRepository.tvShowsData(pagination)
                    await send(.tvShowsResponse(result))
                }
            case let .tvShowsResponse(.success(tvShows)):
                state.tvShows = IdentifiedArrayOf(uniqueElements: tvShows)
                state.isLoading = false
                return .none
            case let .tvShowsResponse(.failure(error)):
                debugPrint(error)
                return .none
            }
        }
    }
}

extension TVShowsCore {
    struct PaginationData: Equatable {
        var topRated = 1
        var nowPlaying = 1
        var popular = 1
    }
}
