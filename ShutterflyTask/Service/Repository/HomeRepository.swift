//
//  HomeRepository.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Dependencies
import Foundation

struct HomeRepository {
    var homeScreenData: (_ pagination: HomeCore.PaginationData) async -> Result<EntertainmentBundle, Error>
    var searchRequest: (String, Int) async -> Result<[Movie], Error>
}

extension HomeRepository: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.tvShowsAPI) var tvShowsAPI
        @Dependency(\.moviesAPI) var moviesAPI
        
        return Self(
            homeScreenData: { pagination in
                async let popularTVShows = tvShowsAPI
                    .popularTVShows(pagination.popularTVShowsPage)
                    .setListType(.trending)
                async let trendingTVShows = tvShowsAPI
                    .trendingTVShows()
                    .setListType(.trending)
                async let trendingMovies = moviesAPI
                    .trendingMovies()
                    .setListType(.trending)
                async let popularMovies = moviesAPI
                    .popularMovies(pagination.popularMoviesPage)
                    .setListType(.popular)
                
                do {
                    let results = try await EntertainmentBundle(
                        trendingMovies: trendingMovies,
                        popularMovies: popularMovies,
                        trendingTVShows: trendingTVShows,
                        popularTVShows: popularTVShows
                    )
                    return .success(results)
                } catch {
                    return .failure(error)
                }
            }, searchRequest: { query, page in
                do {
                    let result = try await moviesAPI.search(query, page)
                    return .success(result)
                } catch {
                    return .failure(error)
                }
            }
        )
    }
}

extension DependencyValues {
    var homeRepository: HomeRepository {
        get { self[HomeRepository.self] }
        set { self[HomeRepository.self] = newValue }
    }
}
