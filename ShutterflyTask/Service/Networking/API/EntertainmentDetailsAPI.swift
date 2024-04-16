//
//  EntertainmentDetailsAPI.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Dependencies
import Foundation

struct EntertainmentDetailsAPI {
    var getDetails: (_ id: Int, _ type: Entertainment.EntertainmentType) async throws -> EntertainmentDetails
    var getCastMembers: (_ id: Int, _ type: Entertainment.EntertainmentType) async throws -> [CastMember]
    var getReviews: (_ id: Int, _ type: Entertainment.EntertainmentType) async throws -> [Review]
    var getTrailerKey: (_ id: Int, _ type: Entertainment.EntertainmentType) async throws -> String?
}

extension EntertainmentDetailsAPI: DependencyKey {
    static var liveValue: EntertainmentDetailsAPI {
        @Dependency(\.networkService) var networkService
        
        return Self(
            getDetails: { id, type in
                let endpoint = EntertainmentDetailsEndpoint(movieID: id, entertainmentType: type)
                switch type {
                case .movie:
                    guard
                        let dtoModel = try await networkService
                            .performRequest(endpoint, MovieDetailsDTO.self) as? MovieDetailsDTO else {
                        throw APIProviderError.dataConversionFailed
                    }
                    return EntertainmentDetails(model: dtoModel)
                case .tvShow:
                    guard
                        let dtoModel = try await networkService
                            .performRequest(endpoint, TVShowDetailsDTO.self) as? TVShowDetailsDTO else {
                        throw APIProviderError.dataConversionFailed
                    }
                    return EntertainmentDetails(model: dtoModel)
                }
            },
            getCastMembers: { id, type in
                let endpoint = CastMembersEndpoint(id: id, entertainmentType: type)
                guard
                    let dtoModel = try await networkService
                        .performRequest(endpoint, ItemCastResponseDTO.self) as? ItemCastResponseDTO else {
                    throw APIProviderError.dataConversionFailed
                }
                return [CastMember](dtoModel: dtoModel)
            },
            getReviews: { id, type in
                let endpoint = ReviewsEndpoint(id: id, entertainmentType: type)
                guard
                    let dtoModel = try await networkService
                        .performRequest(endpoint, ReviewsResponseDTO.self) as? ReviewsResponseDTO else {
                    throw APIProviderError.dataConversionFailed
                }
                return [Review](dtoModel: dtoModel)
            },
            getTrailerKey: { id, type in
                let endpoint = TrailerEndpoint(id: id, entertainmentType: type)
                guard let dtoModel = try await networkService
                    .performRequest(endpoint, TrailerResponseDTO.self) as? TrailerResponseDTO else {
                    throw APIProviderError.dataConversionFailed
                }
                return dtoModel.results.first?.key
            }
        )
    }
}

extension DependencyValues {
    var entertainmentDetailsAPI: EntertainmentDetailsAPI {
        get { self[EntertainmentDetailsAPI.self] }
        set { self[EntertainmentDetailsAPI.self] = newValue }
    }
}
