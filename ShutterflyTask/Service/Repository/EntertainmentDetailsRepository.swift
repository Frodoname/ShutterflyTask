//
//  EntertainmentDetailsRepository.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//


import Dependencies

struct EntertainmentDetailsRepository {
    var getDetails: (_ id: Int, _ type: Entertainment.EntertainmentType) async -> Result<EntertainmentDetailsBundle, Error>
}

extension EntertainmentDetailsRepository: DependencyKey {
    static var liveValue: EntertainmentDetailsRepository {
        @Dependency(\.entertainmentDetailsAPI) var entertainmentDetailsAPI
        
        return Self { id, type in
            async let mainDetails = entertainmentDetailsAPI.getDetails(id, type)
            async let cast = entertainmentDetailsAPI.getCastMembers(id, type)
            async let reviews = entertainmentDetailsAPI.getReviews(id, type)
            
            do {
                let results = try await EntertainmentDetailsBundle(mainDetails: mainDetails, cast: cast, reviews: reviews)
                return .success(results)
            } catch {
                return .failure(error)
            }
        }
    }
}

extension DependencyValues {
    var detailsRepository: EntertainmentDetailsRepository {
        get { self[EntertainmentDetailsRepository.self] }
        set { self[EntertainmentDetailsRepository.self] = newValue }
    }
}
