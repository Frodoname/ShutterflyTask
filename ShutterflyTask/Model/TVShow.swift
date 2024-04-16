//
//  TVShow.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct TVShow {
    let id: UUID
    let itemID: Int
    let title: String
    let image: URL?
    let entertainment: Entertainment
    
    init(model: TVShowResponseDTO.TVShowDTO) {
        self.id = .init()
        self.itemID = model.id
        self.title = model.name
        self.image = ImageURLBuilder.buildURL(forPath: model.backdropPath)
        self.entertainment = .init(type: .tvShow)
    }
    
    init(id: UUID, itemID: Int, title: String, image: URL?, entertainment: Entertainment) {
        self.id = id
        self.itemID = itemID
        self.title = title
        self.image = image
        self.entertainment = entertainment
    }
}

extension TVShow: EntertainmentContent { }

extension Array where Element == TVShow {
    init(dtoModel: TVShowResponseDTO) {
        self.init()
        for dto in dtoModel.results {
            let movie = TVShow(model: dto)
            self.append(movie)
        }
    }
}
