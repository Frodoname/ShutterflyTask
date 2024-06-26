//
//  EntertainmentDetails.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct EntertainmentDetails {
    let id: UUID
    let itemID: Int
    let title: String
    let image: URL?
    let rating: Double
    let overview: String
    let trailerURL: URL?
    let isFavorite: Bool
    
    init(model: MovieDetailsDTO) {
        self.id = .init()
        self.itemID = model.id
        self.title = model.title
        self.image = ImageURLBuilder.buildURL(forPath: model.backdropPath)
        self.rating = model.voteAverage
        self.overview = model.overview
        self.trailerURL = nil
        self.isFavorite = false
    }
    
    init(model: TVShowDetailsDTO) {
        self.id = .init()
        self.itemID = model.id
        self.title = model.name
        self.image = ImageURLBuilder.buildURL(forPath: model.backdropPath)
        self.rating = model.voteAverage
        self.overview = model.overview
        self.trailerURL = nil
        self.isFavorite = false
    }
    
    init(
        id: UUID,
        itemID: Int,
        title: String,
        image: URL?,
        rating: Double,
        overView: String,
        trailerURL: URL?,
        isFavorite: Bool
    ) {
        self.id = id
        self.itemID = itemID
        self.title = title
        self.image = image
        self.rating = rating
        self.overview = overView
        self.trailerURL = trailerURL
        self.isFavorite = isFavorite
    }
}

extension EntertainmentDetails: Equatable, Identifiable { }

extension EntertainmentDetails {
    var toggleFavorite: Self {
        .init(
            id: id,
            itemID: itemID,
            title: title,
            image: image,
            rating: rating,
            overView: overview,
            trailerURL: trailerURL,
            isFavorite: !isFavorite
        )
    }
}
