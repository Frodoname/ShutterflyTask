//
//  Movie.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct Movie {
    let id: UUID
    let itemID: Int
    let title: String
    let image: URL?
    let entertainment: Entertainment
    
    init(model: MovieResponseDTO.MovieDTO) {
        self.id = .init()
        self.itemID = model.id
        self.title = model.title
        self.image = ImageURLBuilder.url(forPath: model.backdropPath)
        self.entertainment = .init(type: .movie)
    }
    
    init(model: MoviesSearchResponseDTO.MovieSearchResultDTO) {
        self.id = .init()
        self.itemID = model.id
        self.title = model.title
        self.image = ImageURLBuilder.url(forPath: model.backdropPath)
        self.entertainment = .init(type: .movie)
    }
    
    init(id: UUID, itemID: Int, title: String, image: URL?, entertainment: Entertainment) {
        self.id = id
        self.itemID = itemID
        self.title = title
        self.image = image
        self.entertainment = entertainment
    }
}

extension Movie: EntertainmentContent { }

extension Array where Element == Movie {
    init(dtoModel: MovieResponseDTO) {
        self.init()
        for dto in dtoModel.results {
            let movie = Movie(model: dto)
            self.append(movie)
        }
    }
    
    init(dtoModel: MoviesSearchResponseDTO) {
        self.init()
        for dto in dtoModel.results {
            let movie = Movie(model: dto)
            self.append(movie)
        }
    }
}
