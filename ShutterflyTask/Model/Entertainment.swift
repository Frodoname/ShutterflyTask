//
//  Entertainment.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct Entertainment {
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

extension Entertainment: Equatable { }

extension Entertainment.ListType: Comparable {
    static func < (lhs: Entertainment.ListType, rhs: Entertainment.ListType) -> Bool {
        func priority(of type: Entertainment.ListType) -> Int {
            switch type {
                case .topRated: return 1
                case .nowPlaying: return 2
                case .popular: return 3
                default: return 4
            }
        }
        return priority(of: lhs) < priority(of: rhs)
    }
}

