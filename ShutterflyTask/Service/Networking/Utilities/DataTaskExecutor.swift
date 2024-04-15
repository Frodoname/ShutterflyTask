//
//  DataTaskExecutor.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Dependencies
import Foundation

struct DataTaskExecutor {
    var executeDataTask: (_ request: URLRequest) async throws -> (Data, URLResponse)
}

extension DataTaskExecutor: DependencyKey {
    static var liveValue: Self {
        @Dependency(\.urlSession) var urlSession
        
        return Self { request in
            do {
                let (data, response) = try await urlSession.data(for: request)
                return (data, response)
            } catch {
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet:
                        throw APIProviderError.noInternetConnection
                    case .timedOut:
                        throw APIProviderError.timeoutError
                    default:
                        throw APIProviderError.unexpectedError(error)
                    }
                } else {
                    throw APIProviderError.unexpectedError(error)
                }
            }
        }
    }
}

extension DependencyValues {
    var dataTaskExecutor: DataTaskExecutor {
        get { self[DataTaskExecutor.self] }
        set { self[DataTaskExecutor.self] = newValue }
    }
}
