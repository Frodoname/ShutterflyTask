//
//  Endpoint.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

protocol EndpointProtocol {
    var httpMethod: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [String: String] { get }
    var body: Encodable? { get }
}

extension EndpointProtocol {
    var httpMethod: HTTPMethod {
        .get
    }
    
    var baseURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = queryItems
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
    
    var queryItems: [URLQueryItem] {
        []
    }
    
    var body: Encodable? {
        nil
    }
    
    var headers: [String: String] {
        [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODIyNzU5NDMzZDI2YjAzMzNjMWMyNmU5NDNhYzI2ZiIsInN1YiI6IjYyOTYwMWJhMWU5MjI1MDA5Y2RiMjVjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fwaPeeIoWgLaOne9RijPxFgJ3lGKe75zdfx-XmnH0A4"
        ]
    }
}
