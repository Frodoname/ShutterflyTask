//
//  NowPlayingTVShowsResponseDTO.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

struct NowPlayingTVShowsResponseDTO: Decodable {
    let page: Int
    let results: [NowPlayingTVShowDTO]
    let totalPages: Int
    let totalResults: Int
    
    struct NowPlayingTVShowDTO: Decodable {
        let adult: Bool
        let backdropPath: String
        let genreIds: [Int]
        let id: Int
        let originalLanguage: String
        let originalTitle: String
        let overview: String
        let popularity: Double
        let posterPath: String
        let releaseDate: String
        let title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int
    }
}
