//
//  MovieDetailsDTO.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct MovieDetailsDTO: Decodable {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: BelongsToCollectionDTO?
    let budget: Int
    let genres: [GenreDTO]
    let homepage: String?
    let id: Int
    let imdbId: String?
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompanyDTO]
    let releaseDate: String
    let revenue: Int
    let runtime: Int?
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
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

    struct BelongsToCollectionDTO: Decodable {
        let id: Int
        let name: String
        let posterPath: String
        let backdropPath: String
    }
}
