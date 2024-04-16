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
