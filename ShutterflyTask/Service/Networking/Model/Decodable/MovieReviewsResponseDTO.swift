//
//  MovieReviewsResponseDTO.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct ReviewsResponseDTO: Decodable {
    let id: Int
    let page: Int
    let results: [ReviewDTO]
    let totalPages: Int
    let totalResults: Int
    
    struct ReviewDTO: Decodable {
        let author: String
        let authorDetails: AuthorDetailsDTO
        let content: String
        let createdAt: String
        let id: String
        let updatedAt: String
        let url: String
        
        struct AuthorDetailsDTO: Decodable {
            let name: String
            let username: String
            let avatarPath: String?
            let rating: Double?
        }
    }
}
