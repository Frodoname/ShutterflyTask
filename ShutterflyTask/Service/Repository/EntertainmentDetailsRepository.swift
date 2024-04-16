//
//  EntertainmentDetailsRepository.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Dependencies
import Foundation

struct EntertainmentDetailsRepository {
    var getDetails: (_ id: Int, _ type: Entertainment.EntertainmentType) async -> Result<EntertainmentDetailsBundle, Error>
    var toggleFavorite: (_ id: Int?) -> Result<EntertainmentDetailsBundle, Error>
}

extension EntertainmentDetailsRepository {
    enum FavoriteError: Error {
        case invalidId
        case itemNotFound
    }
}

extension EntertainmentDetailsRepository: DependencyKey {
    static var liveValue: EntertainmentDetailsRepository {
        @Dependency(\.entertainmentDetailsAPI) var entertainmentDetailsAPI
        
        return Self(
            getDetails: { id, type in
                if let cachedDetails = EntertainmentDetailsCache.shared.get(id) {
                    return .success(cachedDetails)
                }
                
                async let mainDetails = entertainmentDetailsAPI.getDetails(id, type)
                async let cast = entertainmentDetailsAPI.getCastMembers(id, type)
                async let reviews = entertainmentDetailsAPI.getReviews(id, type)
                async let trailer = entertainmentDetailsAPI.getTrailerKey(id, type)
                
                do {
                    let results = try await EntertainmentDetailsBundle(
                        mainDetails: mainDetails,
                        trailerKey: trailer,
                        cast: cast,
                        reviews: reviews
                    )
                    EntertainmentDetailsCache.shared.set(results)
                    return .success(results)
                } catch {
                    return .failure(error)
                }
            }, toggleFavorite: { id in
                guard let id else { return .failure(FavoriteError.invalidId) }
                guard let cachedDetails = EntertainmentDetailsCache.shared.get(id) else {
                    return .failure(FavoriteError.itemNotFound)
                }
                let toggledDetails = cachedDetails.toggleFavorite
                EntertainmentDetailsCache.shared.set(toggledDetails)
                return .success(toggledDetails)
            }
        )
    }
}

extension DependencyValues {
    var detailsRepository: EntertainmentDetailsRepository {
        get { self[EntertainmentDetailsRepository.self] }
        set { self[EntertainmentDetailsRepository.self] = newValue }
    }
}
