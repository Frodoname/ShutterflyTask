//
//  FavoriteRepository.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Dependencies
import Foundation

struct FavoriteRepository {
    var getFavorites: () -> [EntertainmentDetailsBundle]
}

extension FavoriteRepository: DependencyKey {
    static var liveValue: FavoriteRepository {
        return Self {
            EntertainmentDetailsCache
                .shared
                .getAllData()
                .filter { $0.mainDetails.isFavorite }
        }
    }
}

extension DependencyValues {
    var favoritesRepository: FavoriteRepository {
        get { self[FavoriteRepository.self] }
        set { self[FavoriteRepository.self] = newValue }
    }
}
