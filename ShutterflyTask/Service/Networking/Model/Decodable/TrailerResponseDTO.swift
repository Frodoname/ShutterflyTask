//
//  TrailerResponseDTO.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

struct TrailerResponseDTO: Decodable {
    let id: Int
    let results: [TrailerDTO]
    
    struct TrailerDTO: Decodable {
        let key: String
    }
}
