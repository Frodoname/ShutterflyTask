//
//  DataDecoder.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Dependencies
import Foundation

struct DataDecoder {
    var decode: (Data, Decodable.Type) throws -> Decodable
}

extension DataDecoder: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.jsonDecoder) var decoder
        
        return Self { data, type in
            do {
                return try decoder.decode(type.self, from: data)
            } catch {
                throw APIProviderError.decodingError(error)
            }
        }
    }
}

extension DependencyValues {
    var dataDecoder: DataDecoder {
        get { self[DataDecoder.self] }
        set { self[DataDecoder.self] = newValue }
    }
}
