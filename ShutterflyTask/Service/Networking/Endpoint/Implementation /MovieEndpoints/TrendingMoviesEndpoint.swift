//
//  TrendingMoviesEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 09.04.2024.
//

import Foundation

struct TrendingMoviesEndpoint: EndpointProtocol {
    let path = "/3/trending/movie/day"
}

extension EndpointProtocol where Self == TrendingMoviesEndpoint {
    static var trendingMovies: Self {
        .init()
    }
}
