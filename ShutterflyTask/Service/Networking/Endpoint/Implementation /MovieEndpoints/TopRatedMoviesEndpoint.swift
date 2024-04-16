//
//  TopRatedMoviesEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 12.04.2024.
//

import Foundation

struct TopRatedMoviesEndpoint: EndpointProtocol {
    let page: Int
    let path = "/3/movie/top_rated"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "page", value: "\(page)")
        ]
    }
}
