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
        var path = StackState<DetailsCore.State>()
        var tvShows: IdentifiedArrayOf<TVShow> = []
        var pagination = PaginationData()
        var isLoading = false
        var isDataLoaded = false
    }
    
    enum Action {
        case fetchAllTVShows
        case tvShowsResponse(Result<[TVShow], Error>)
        case sortTVShows(Entertainment.ListType)
        case path(StackAction<DetailsCore.State, DetailsCore.Action>)
    }
    
    @Dependency(\.tvShowsRepository) private var tvShowsRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAllTVShows:
                guard !state.isDataLoaded else { return .none }
                state.isLoading = true
                return .run { [pagination = state.pagination] send in
                    let result = await tvShowsRepository.tvShowsData(pagination)
                    await send(.tvShowsResponse(result))
                }
            case let .tvShowsResponse(.success(tvShows)):
                state.tvShows = IdentifiedArrayOf(uniqueElements: tvShows)
                state.isLoading = false
                state.isDataLoaded = true
                return .none
            case let .tvShowsResponse(.failure(error)):
                debugPrint(error)
                return .none
            case .sortTVShows(let listType):
                state.tvShows.sort { ($0.entertainment.listType == listType) && ($1.entertainment.listType != listType) }
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

extension TVShowsCore {
    struct PaginationData: Equatable {
        var topRated = 1
        var nowPlaying = 1
        var popular = 1
    }
}
