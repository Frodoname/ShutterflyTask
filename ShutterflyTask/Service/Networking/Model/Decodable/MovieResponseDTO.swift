//
//  MovieResponseDTO.swift
//  ShutterflySketches
//
//  Created by Fed on 09.04.2024.
//

import Foundation

struct MovieResponseDTO: Decodable {
    let page: Int
    let results: [MovieDTO]
    let totalPages: Int
    let totalResults: Int
    
    struct MovieDTO: Decodable {
        let adult: Bool
        let backdropPath: String?
        let id: Int
        let title: String
        let originalLanguage: String
        let originalTitle: String
        let overview: String
        let posterPath: String?
        let mediaType: String?
        let genreIds: [Int]
        let popularity: Double
        let releaseDate: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int
    }
}
