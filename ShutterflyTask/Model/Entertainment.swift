//
//  Entertainment.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct Entertainment: Equatable {
    enum EntertainmentType: String {
        case movie = "movie"
        case tvShow = "tv"
    }

    enum ListType {
        case undefined
        case searched
        case trending
        case popular
        case topRated
        case nowPlaying
    }
    
    let type: EntertainmentType
    let listType: ListType
    
    init(type: EntertainmentType, listType: ListType = .undefined) {
        self.type = type
        self.listType = listType
    }
}
