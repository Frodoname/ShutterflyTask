//
//  URLRequestBuilder.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Dependencies
import Foundation

struct URLRequestBuilder {
    var buildRequest: (EndpointProtocol) throws -> URLRequest
}

extension URLRequestBuilder: DependencyKey {
    static var liveValue: URLRequestBuilder {
        @Dependency(\.jsonEncoder) var encoder
        
        return Self { endpoint in
            var request = URLRequest(url: endpoint.baseURL, timeoutInterval: 15)
            request.httpMethod = endpoint.httpMethod.rawValue
            endpoint
                .headers
                .forEach {
                    request.setValue($1, forHTTPHeaderField: $0)
                }
            if let body = endpoint.body {
                do {
                    request.httpBody = try encoder.encode(body)
                } catch {
                    throw APIProviderError.encodingError(error)
                }
            }
            return request
        }
    }
}

extension DependencyValues {
    var requestBuilder: URLRequestBuilder {
        get { self[URLRequestBuilder.self] }
        set { self[URLRequestBuilder.self] = newValue }
    }
}
