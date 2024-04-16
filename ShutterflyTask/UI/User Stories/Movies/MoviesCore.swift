//
//  MoviesCore.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture

@Reducer
struct MoviesCore {
    @ObservableState
    struct State: Equatable {
        var movies: IdentifiedArrayOf<Movie> = []
        var pagination = PaginationData()
        var isLoading = false
    }
    
    enum Action {
        case fetchAllMovies
        case moviesResponse(Result<[Movie], Error>)
    }
    
    @Dependency(\.moviesRepository) private var moviesRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAllMovies:
                state.isLoading = true
                return .run { [pagination = state.pagination] send in
                    let result = await moviesRepository.moviesData(pagination)
                    await send(.moviesResponse(result))
                }
            case let .moviesResponse(.success(movies)):
                state.movies = IdentifiedArrayOf(uniqueElements: movies)
                state.isLoading = false
                return .none
            case let .moviesResponse(.failure(error)):
                debugPrint(error)
                return .none
            }
        }
    }
}

extension MoviesCore {
    struct PaginationData: Equatable {
        var topRated = 1
        var nowPlaying = 1
        var popular = 1
    }
}
