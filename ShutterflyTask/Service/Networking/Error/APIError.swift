//
//  APIError.swift
//  ShutterflySketches
//
//  Created by Fed on 09.04.2024.
//

import Foundation

struct APIError: LocalizedError {
    let statusCode: HTTPStatusCode
    let message: String?
    let errorData: Data?
    
    init?(data: Data, response: HTTPURLResponse) {
        guard let statusCode = HTTPStatusCode(rawValue: response.statusCode) else { return nil }
        
        self.statusCode = statusCode
        self.message = String(data: data, encoding: .utf8)
        self.errorData = data
    }
    
    var errorDescription: String? {
        return "Error code: \(statusCode.rawValue)"
    }
}
