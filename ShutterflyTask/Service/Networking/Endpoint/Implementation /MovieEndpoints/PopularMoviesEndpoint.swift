//
//  PopularMoviesEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 10.04.2024.
//

import Foundation

struct PopularMoviesEndpoint: EndpointProtocol {
    let page: Int
    let path = "/3/movie/popular"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)")
        ]
    }
}

extension EndpointProtocol where Self == PopularMoviesEndpoint {
    static func popularMovies(for page: Int) -> Self {
        .init(page: page)
    }
}
