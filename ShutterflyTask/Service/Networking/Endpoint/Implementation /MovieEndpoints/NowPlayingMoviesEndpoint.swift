//
//  NowPlayingMoviesEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 12.04.2024.
//

import Foundation

struct NowPlayingMoviesEndpoint: EndpointProtocol {
    let page: Int
    let path = "/3/movie/now_playing"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)")
        ]
    }
}

extension EndpointProtocol where Self == NowPlayingMoviesEndpoint {
    static func nowPlayingMovies(for page: Int) -> Self {
        .init(page: page)
    }
}
