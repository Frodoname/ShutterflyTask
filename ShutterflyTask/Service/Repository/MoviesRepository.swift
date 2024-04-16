//
//  MoviesRepository.swift
//  ShutterflySketches
//
//  Created by Fed on 14.04.2024.
//

import Dependencies
import Foundation

struct MoviesRepository {
    var moviesData: (_ pagination: MoviesCore.PaginationData) async -> Result<[Movie], Error>
}

extension MoviesRepository: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.moviesAPI) var moviesAPI
        
        return Self { pagination in
            async let topRated = moviesAPI
                .topRatedMovies(pagination.topRated)
                .setListType(.topRated)
            async let nowPlaying = moviesAPI
                .nowPlayingMovies(pagination.nowPlaying)
                .setListType(.nowPlaying)
            async let popular = moviesAPI
                .popularMovies(pagination.popular)
                .setListType(.popular)
            
            do {
                let allMovies = try await [topRated, nowPlaying, popular].flatMap { $0 }
                return .success(allMovies)
            } catch {
                return .failure(error)
            }
        }
    }
}

extension DependencyValues {
    var moviesRepository: MoviesRepository {
        get { self[MoviesRepository.self] }
        set { self[MoviesRepository.self] = newValue }
    }
}
