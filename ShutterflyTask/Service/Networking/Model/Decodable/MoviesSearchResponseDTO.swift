//
//  MoviesSearchResponseDTO.swift
//  ShutterflySketches
//
//  Created by Fed on 10.04.2024.
//

import Foundation

struct MoviesSearchResponseDTO: Decodable {
    let page: Int
    let results: [MovieSearchResultDTO]
    let totalPages: Int
    let totalResults: Int
    
    struct MovieSearchResultDTO: Decodable {
        let adult: Bool
        let backdropPath: String?
        let genreIds: [Int]
        let id: Int
        let originalLanguage: String
        let originalTitle: String
        let overview: String
        let popularity: Double
        let posterPath: String?
        let releaseDate: String
        let title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int
    }
}
