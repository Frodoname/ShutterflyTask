//
//  TrendingTVShowsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 10.04.2024.
//

import Foundation

struct TrendingTVShowsEndpoint: EndpointProtocol {
    let path =  "/3/trending/tv/day"
}

extension EndpointProtocol where Self == TrendingTVShowsEndpoint {
    static var trendingTVShows: Self {
        .init()
    }
}
