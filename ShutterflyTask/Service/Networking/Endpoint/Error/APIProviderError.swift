//
//  APIProviderError.swift
//  ShutterflySketches
//
//  Created by Fed on 09.04.2024.
//

import Foundation

enum APIProviderError: Error {
    case invalidEndpoint
    case emptyTokenManager
    case invalidResponse
    case decodingError(Error)
    case encodingError(Error)
    case serverError(APIError)
    case timeoutError
    case noInternetConnection
    case unexpectedError(Error)
}
