//
//  ImageURLBuilder.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct ImageURLBuilder {
    static let baseURL = "https://image.tmdb.org/t/p/w500"
    
    private init() { }
    
    static func url(forPath imagePath: String?) -> URL? {
        guard
            let imagePath = imagePath,
            let url = URL(string: baseURL + imagePath) else {
            return nil
        }
        return url
    }
}
