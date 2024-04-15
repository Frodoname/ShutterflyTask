//
//  NetworkService.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Dependencies
import Foundation

struct NetworkService {
    var performRequest: (EndpointProtocol, Decodable.Type) async throws -> Decodable
}

extension NetworkService: DependencyKey {
    static var liveValue: NetworkService {
        @Dependency(\.dataDecoder) var decoder
        @Dependency(\.dataTaskExecutor) var taskExecutor
        @Dependency(\.requestBuilder) var requestBuilder
        
        return Self { endpoint, responseModel in
            let request = try requestBuilder.buildRequest(endpoint)
            
            do {
                let (data, response) = try await taskExecutor.executeDataTask(request)
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIProviderError.invalidResponse
                }
                
                if let apiError = APIError(data: data, response: httpResponse) {
                    throw APIProviderError.serverError(apiError)
                }
                
                let decodedData = try decoder.decode(data, responseModel)
                return decodedData
            } catch {
                throw APIProviderError.unexpectedError(error)
            }
        }
    }
}

extension DependencyValues {
    var networkService: NetworkService {
        get { self[NetworkService.self] }
        set { self[NetworkService.self] = newValue }
    }
}

