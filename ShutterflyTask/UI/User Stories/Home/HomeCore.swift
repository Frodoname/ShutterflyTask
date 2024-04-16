//
//  HomeCore.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct HomeCore {
    @ObservableState
    struct State: Equatable {
        var path = StackState<DetailsCore.State>()
        var searchText = ""
        var trendingMovies: IdentifiedArrayOf<Movie> = []
        var popularMovies: IdentifiedArrayOf<Movie> = []
        var trendingTVShows: IdentifiedArrayOf<TVShow> = []
        var popularTVShows: IdentifiedArrayOf<TVShow> = []
        var foundMovies: IdentifiedArrayOf<Movie> = []
        var paginationData = PaginationData()
        var isLoading = false
        var isSearchLoading = false
        var isDataLoaded = false
    }
    
    enum Action {
        case fetchAllData
        case dataResponse(Result<EntertainmentBundle, Error>)
        case searchResponse(Result<[Movie], Error>)
        case setSearchResult(String)
        case path(StackAction<DetailsCore.State, DetailsCore.Action>)
    }
    
    enum CancelID {
        case search
    }
    
    @Dependency(\.homeRepository) private var homeRepository
    @Dependency(\.mainQueue) private var mainQueue
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAllData:
                guard !state.isDataLoaded else { return .none }
                state.isLoading = true
                return .run { [paginationData = state.paginationData] send in
                    let result = await homeRepository.homeScreenData(paginationData)
                    await send(.dataResponse(result))
                    
                }
            case let .dataResponse(.success(enertainmentBundle)):
                state.trendingMovies = IdentifiedArrayOf(uniqueElements: enertainmentBundle.trendingMovies)
                state.popularMovies = IdentifiedArrayOf(uniqueElements: enertainmentBundle.popularMovies)
                state.trendingTVShows = IdentifiedArrayOf(uniqueElements: enertainmentBundle.trendingTVShows)
                state.popularTVShows = IdentifiedArray(uniqueElements: enertainmentBundle.popularTVShows)
                state.isLoading = false
                state.isDataLoaded = true
                return .none
            case let .dataResponse(.failure(error)):
                state.isLoading = false
                debugPrint(error.localizedDescription)
                return .none
            case let .searchResponse(.success(foundMovies)):
                state.isSearchLoading = false
                state.foundMovies = IdentifiedArrayOf(uniqueElements: foundMovies)
                return .none
            case let .searchResponse(.failure(error)):
                state.isSearchLoading = false
                debugPrint(error.localizedDescription)
                return .none
            case .setSearchResult(let searchQuery):
                state.searchText = searchQuery
                guard !state.searchText.isEmpty else { return .none }
                state.isSearchLoading = true
                return .run { [searchText = state.searchText, page = state.paginationData.searchPage] send in
                    let result = await homeRepository.searchRequest(searchText, page)
                    await send(.searchResponse(result))
                }
                .debounce(id: CancelID.search, for: 0.5, scheduler: self.mainQueue)
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            DetailsCore()
        }
    }
}

extension HomeCore {
    struct PaginationData: Equatable {
        var trendingTVShowsPage = 1
        var popularTVShowsPage = 1
        var trendingMoviesPage = 1
        var popularMoviesPage = 1
        var searchPage = 1
    }
}
