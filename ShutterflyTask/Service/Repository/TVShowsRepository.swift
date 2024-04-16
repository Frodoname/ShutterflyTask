//
//  TVShowsRepository.swift
//  ShutterflySketches
//
//  Created by Fed on 14.04.2024.
//

import Dependencies
import Foundation

struct TVShowsRepository {
    var tvShowsData: (_ pagination: TVShowsCore.PaginationData) async -> Result<[TVShow], Error>
}

extension TVShowsRepository: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.tvShowsAPI) var tvShowsAPI
        
        return Self { pagination in
            async let topRated = tvShowsAPI
                .topRatedTVShows(pagination.topRated)
                .setListType(.topRated)
            async let nowPlaying = tvShowsAPI
                .nowPlayingTVShows(pagination.nowPlaying)
                .setListType(.nowPlaying)
            async let popularMovies = tvShowsAPI
                .popularTVShows(pagination.popular)
                .setListType(.popular)
            
            do {
                let allTVShows = try await [topRated, nowPlaying, popularMovies].flatMap { $0 }
                return .success(allTVShows)
            } catch {
                return .failure(error)
            }
        }
    }
}

extension DependencyValues {
    var tvShowsRepository: TVShowsRepository {
        get { self[TVShowsRepository.self] }
        set { self[TVShowsRepository.self] = newValue }
    }
}
