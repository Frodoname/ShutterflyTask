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
}

extension EntertainmentDetailsAPI: DependencyKey {
    static var liveValue: EntertainmentDetailsAPI {
        @Dependency(\.networkService) var networkService
        
        return Self(
            getDetails: { id, type in
                do {
                    let endpoint = EntertainmentDetailsEndpoint(movieID: id, entertainmentType: type)
                    guard
                        let dtoModel = try await networkService
                            .performRequest(endpoint, EntertainmentDetailsDTO.self) as? EntertainmentDetailsDTO else {
                        throw APIProviderError.dataConversionFailed
                    }
                    return EntertainmentDetails(model: dtoModel)
                } catch {
                    throw error
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
