//
//  EntertainmentDetailsBundle.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct EntertainmentDetailsBundle {
    let mainDetails: EntertainmentDetails
    let trailerURL: URL?
    let cast: [CastMember]
    let reviews: [Review]
    
    init(mainDetails: EntertainmentDetails, trailerKey: String?, cast: [CastMember], reviews: [Review]) {
        self.mainDetails = mainDetails
        self.trailerURL = VideoURLBuilder.buildURL(forPath: trailerKey)
        self.cast = cast
        self.reviews = reviews
    }
    
    private init(mainDetails: EntertainmentDetails, trailerURL: URL?, cast: [CastMember], reviews: [Review]) {
        self.mainDetails = mainDetails
        self.trailerURL = trailerURL
        self.cast = cast
        self.reviews = reviews
    }
}

extension EntertainmentDetailsBundle: Equatable { }

extension EntertainmentDetailsBundle {
    var toggleFavorite: Self {
        .init(
            mainDetails: mainDetails.toggleFavorite,
            trailerURL: trailerURL,
            cast: cast,
            reviews: reviews
        )
    }
}
