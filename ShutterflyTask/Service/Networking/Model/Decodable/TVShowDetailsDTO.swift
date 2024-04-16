//
//  TVShowDetailsDTO.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

struct TVShowDetailsDTO: Decodable {
    let adult: Bool
    let backdropPath: String?
    let createdBy: [Creator]
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [GenreDTO]
    let homepage: String?
    let id: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: Episode?
    let name: String
    let nextEpisodeToAir: Episode?
    let networks: [Network]
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompanyDTO]
    let seasons: [Season]
    let status: String
    let tagline: String?
    let type: String
    let voteAverage: Double
    let voteCount: Int
    
    struct GenreDTO: Decodable {
        let id: Int
        let name: String
    }
    
    struct ProductionCompanyDTO: Decodable {
        let id: Int
        let logoPath: String?
        let name: String
        let originCountry: String
    }

    struct Creator: Codable {
        let id: Int
        let creditId: String
        let name: String
        let originalName: String
        let gender: Int
        let profilePath: String?
    }

    struct Episode: Codable {
        let id: Int
        let overview: String
        let name: String
        let voteAverage: Double
        let voteCount: Int
        let airDate: String
        let episodeNumber: Int
        let episodeType: String?
        let productionCode: String?
        let runtime: Int?
        let seasonNumber: Int
        let showId: Int
        let stillPath: String?
    }

    struct Network: Codable {
        let id: Int
        let logoPath: String?
        let name: String
        let originCountry: String
    }

    struct Season: Codable {
        let airDate: String?
        let episodeCount: Int
        let id: Int
        let name: String
        let overview: String?
        let posterPath: String?
        let seasonNumber: Int
        let voteAverage: Double
    }
}
