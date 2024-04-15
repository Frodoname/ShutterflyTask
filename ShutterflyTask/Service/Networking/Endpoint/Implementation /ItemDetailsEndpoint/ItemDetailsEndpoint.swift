//
//  ItemDetailsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct ItemDetailsEndpoint: EndpointProtocol {
    let movieID: Int
    let entertainmentType: Entertainment.EntertainmentType

    var path: String {
        "/3/\(entertainmentType.rawValue)/\(movieID)"
    }
}

extension EndpointProtocol where Self == ItemDetailsEndpoint {
    static func movieDetails(for movieID: Int, of type: Entertainment.EntertainmentType) -> Self {
        .init(movieID: movieID, entertainmentType: type)
    }
}
