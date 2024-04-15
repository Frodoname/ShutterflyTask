//
//  HTTPStatusCode.swift
//  ShutterflySketches
//
//  Created by Fed on 09.04.2024.
//

import Foundation

enum HTTPStatusCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case incorrectPayload = 415
    case unprocessableEntity = 422
    case tooManyRequests = 429
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 5
}
