//
//  MoviesAPI.swift
//  ShutterflySketches
//
//  Created by Fed on 09.04.2024.
//

import Dependencies
import Foundation

struct MoviesAPI {
    var trendingMovies: () async throws -> [Movie]
    var popularMovies: (_ page: Int) async throws -> [Movie]
    var topRatedMovies: (_ page: Int) async throws -> [Movie]
    var nowPlayingMovies: (_ page: Int) async throws -> [Movie]
    var search: (_ query: String, _ page: Int) async throws -> [Movie]
}

extension MoviesAPI: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.networkService) var networkService
        
        return Self {
            guard
                let dtoModel = try await networkService
                    .performRequest(TrendingMoviesEndpoint(), MovieResponseDTO.self) as? MovieResponseDTO else {
                throw APIProviderError.dataConversionFailed
            }
            return [Movie](dtoModel: dtoModel)
        } popularMovies: { page in
            let endpoint = PopularMoviesEndpoint(page: page)
            guard
                let dtoModel = try await networkService
                    .performRequest(endpoint, MovieResponseDTO.self) as? MovieResponseDTO else {
                throw APIProviderError.dataConversionFailed
            }
            return [Movie](dtoModel: dtoModel)
        } topRatedMovies: { page in
            let endpoint = TopRatedMoviesEndpoint(page: page)
            guard
                let dtoModel = try await networkService
                    .performRequest(endpoint, MovieResponseDTO.self) as? MovieResponseDTO else {
                throw APIProviderError.dataConversionFailed
            }
            return [Movie](dtoModel: dtoModel)
        } nowPlayingMovies: { page in
            let endpoint = NowPlayingMoviesEndpoint(page: page)
            guard
                let dtoModel = try await networkService
                    .performRequest(endpoint, MovieResponseDTO.self) as? MovieResponseDTO else {
                throw APIProviderError.dataConversionFailed
            }
            return [Movie](dtoModel: dtoModel)
        } search: { query, page in
            let endpoint = SearchMoviesEndpoint(searchText: query, page: page)
            guard
                let dtoModel = try await networkService
                    .performRequest(endpoint, MoviesSearchResponseDTO.self) as? MoviesSearchResponseDTO else {
                throw APIProviderError.dataConversionFailed
            }
            return [Movie](dtoModel: dtoModel)
        }

    }
}

extension DependencyValues {
    var moviesAPI: MoviesAPI {
        get { self[MoviesAPI.self] }
        set { self[MoviesAPI.self] = newValue }
    }
}
