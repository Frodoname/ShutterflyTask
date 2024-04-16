//
//  NowPlayingTVShowsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 12.04.2024.
//

import Foundation

struct NowPlayingTVShowsEndpoint: EndpointProtocol {
    let page: Int
    let path = "/3/tv/airing_today"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)")
        ]
    }
}
