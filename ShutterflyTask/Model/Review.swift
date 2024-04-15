//
//  Review.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct Review {
    let id: UUID
    let author: String
    let content: String
    
    init(model: ReviewsResponseDTO.ReviewDTO) {
        self.id = .init()
        self.author = model.author
        self.content = model.content
    }
}

extension Review: Identifiable, Equatable { }

extension Array where Element == Review {
    init(dtoModel: ReviewsResponseDTO) {
        self.init()
        for dto in dtoModel.results {
            let review = Review(model: dto)
            self.append(review)
        }
    }
}
