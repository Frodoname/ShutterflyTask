//
//  PopularTVShowsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 12.04.2024.
//

import Foundation

struct PopularTVShowsEndpoint: EndpointProtocol {
    let page: Int
    let path = "/3/tv/popular"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)")
        ]
    }
}
