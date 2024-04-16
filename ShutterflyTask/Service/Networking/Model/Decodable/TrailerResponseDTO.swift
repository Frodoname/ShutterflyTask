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
//        let iso6391: String
//        let iso31661: String
//        let name: String
        let key: String
//        let site: String
//        let size: Int
//        let type: String
//        let official: Bool
//        let publishedAt: String
//        let id: String
    }
}
