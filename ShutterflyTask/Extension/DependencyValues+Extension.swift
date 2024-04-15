//
//  DependencyValues+Extension.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Dependencies
import Foundation

extension JSONDecoder: DependencyKey {
    public static var liveValue: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

extension DependencyValues {
    var jsonDecoder: JSONDecoder {
        get { self[JSONDecoder.self] }
        set { self[JSONDecoder.self] = newValue }
    }
}

extension JSONEncoder: DependencyKey {
    public static var liveValue: JSONEncoder {
        let decoder = JSONEncoder()
        decoder.keyEncodingStrategy = .convertToSnakeCase
        return decoder
    }
}

extension DependencyValues {
    var jsonEncoder: JSONEncoder {
        get { self[JSONEncoder.self] }
        set { self[JSONEncoder.self] = newValue }
    }
}

