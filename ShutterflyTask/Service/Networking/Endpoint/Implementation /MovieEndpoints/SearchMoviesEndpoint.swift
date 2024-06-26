//
//  SearchMoviesEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 10.04.2024.
//

import Foundation

struct SearchMoviesEndpoint: EndpointProtocol {
    let searchText: String
    let page: Int
    let path = "/3/search/movie"
    
    var queryItems: [URLQueryItem] {
        [
            .init(name: "query", value: searchText),
            .init(name: "page", value: "\(page)")
        ]
    }
}
