//
//  TVShowsAPI.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Dependencies
import Foundation

struct TVShowsAPI {
    var trendingTVShows: () async throws -> [TVShow]
    var popularTVShows: (_ page: Int) async throws -> [TVShow]
    var topRatedTVShows: (_ page: Int) async throws -> [TVShow]
    var nowPlayingTVShows: (_ page: Int) async throws -> [TVShow]
}

extension TVShowsAPI: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.networkService) var networkService

        func fetchTVShows(endpoint: EndpointProtocol) async throws -> [TVShow] {
            guard
                let dtoModel = try await networkService
                    .performRequest(endpoint, TVShowResponseDTO.self) as? TVShowResponseDTO else {
                throw APIProviderError.dataConversionFailed
            }
            return Array<TVShow>(dtoModel: dtoModel)
        }
        
        return Self(
            trendingTVShows: { try await fetchTVShows(endpoint: .trendingTVShows) },
            popularTVShows: { page in try await fetchTVShows(endpoint: .popularTVShows(for: page)) },
            topRatedTVShows: { page in try await fetchTVShows(endpoint: .topRatedTVShows(for: page)) },
            nowPlayingTVShows: { page in try await fetchTVShows(endpoint: .nowPlayingTVShows(for: page)) }
        )
    }
}

extension DependencyValues {
    var tvShowsAPI: TVShowsAPI {
        get { self[TVShowsAPI.self] }
        set { self[TVShowsAPI.self] = newValue }
    }
}
