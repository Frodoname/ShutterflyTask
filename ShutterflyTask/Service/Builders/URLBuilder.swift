//
//  URLBuilder.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

protocol URLBuilder {
    static var baseURL: String { get }
    static func buildURL(forPath path: String?) -> URL?
}

extension URLBuilder {
    static func buildURL(forPath path: String?) -> URL? {
        guard let path = path, let url = URL(string: self.baseURL + path) else {
            return nil
        }
        return url
    }
}

struct VideoURLBuilder: URLBuilder {
    static let baseURL = "https://www.youtube.com/embed/"
    private init() { }
}

struct ImageURLBuilder: URLBuilder {
    static let baseURL = "https://image.tmdb.org/t/p/w500"
    private init() { }
}
