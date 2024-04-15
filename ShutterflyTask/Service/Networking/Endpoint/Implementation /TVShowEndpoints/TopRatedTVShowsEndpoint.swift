//
//  TopRatedTVShowsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 12.04.2024.
//

import Foundation

struct TopRatedTVShowsEndpoint: EndpointProtocol {
    let page: Int
    let path = "/3/tv/top_rated"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)")
        ]
    }
}

extension EndpointProtocol where Self == TopRatedTVShowsEndpoint {
    static func topRatedTVShows(for page: Int) -> Self {
        .init(page: page)
    }
}
