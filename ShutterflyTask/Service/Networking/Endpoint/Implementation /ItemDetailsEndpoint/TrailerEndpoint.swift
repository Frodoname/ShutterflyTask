//
//  TrailerEndpoint.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

struct TrailerEndpoint: EndpointProtocol {
    let id: Int
    let entertainmentType: Entertainment.EntertainmentType
    
    var path: String {
        "/3/\(entertainmentType.rawValue)/\(id)/videos"
    }
}
