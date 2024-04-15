//
//  TVShowResponseDTO.swift
//  ShutterflySketches
//
//  Created by Fed on 10.04.2024.
//

import Foundation

struct TVShowResponseDTO: Decodable {
    let page: Int
    let results: [TVShowDTO]
    let totalPages: Int
    let totalResults: Int
    
    struct TVShowDTO: Decodable {
        let adult: Bool
        let backdropPath: String?
        let id: Int
        let name: String
        let originalLanguage: String
        let originalName: String
        let overview: String
        let posterPath: String?
        let mediaType: String?
        let genreIds: [Int]
        let popularity: Double
        let firstAirDate: String
        let voteAverage: Double
        let voteCount: Int
        let originCountry: [String]
    }
}
