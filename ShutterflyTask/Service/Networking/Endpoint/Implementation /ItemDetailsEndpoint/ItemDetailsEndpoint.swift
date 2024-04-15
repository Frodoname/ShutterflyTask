//
//  ItemDetailsEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct EntertainmentDetailsEndpoint: EndpointProtocol {
    let movieID: Int
    let entertainmentType: Entertainment.EntertainmentType

    var path: String {
        "/3/\(entertainmentType.rawValue)/\(movieID)"
    }
}
