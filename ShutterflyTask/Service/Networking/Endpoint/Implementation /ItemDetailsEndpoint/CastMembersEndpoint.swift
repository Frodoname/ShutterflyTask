//
//  CastMembersEndpoint.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct CastMembersEndpoint: EndpointProtocol {
    let id: Int
    let entertainmentType: Entertainment.EntertainmentType
    
    var path: String {
        "/3/\(entertainmentType.rawValue)/\(id)/credits"
    }
}

extension EndpointProtocol where Self == CastMembersEndpoint {
    static func cast(for id: Int, of type: Entertainment.EntertainmentType) -> Self {
        .init(id: id, entertainmentType: type)
    }
}
