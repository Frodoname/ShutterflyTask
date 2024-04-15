//
//  ReviewsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct ReviewsEndpoint: EndpointProtocol {
    let id: Int
    let entertainmentType: Entertainment.EntertainmentType
    
    var path: String {
        "/3/\(entertainmentType.rawValue)/\(id)/reviews"
    }
}

extension EndpointProtocol where Self == ReviewsEndpoint {
    static func reviews(for id: Int, of type: Entertainment.EntertainmentType) -> Self {
        .init(id: id, entertainmentType: type)
    }
}
