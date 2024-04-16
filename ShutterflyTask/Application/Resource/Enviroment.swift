//
//  Enviroment.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

struct Environment {
    enum Keys: String {
        case baseURL = "BASE_URL"
        case apiToken = "API_TOKEN"
    }
    
    private init() { }
    
    static func getValue(for key: Keys) -> String {
        guard let property = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            fatalError("\(key.rawValue) not found")
        }
        return property
    }
}
