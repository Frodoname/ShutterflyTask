//
//  ItemCastResponseDTO.swift
//  ShutterflySketches
//
//  Created by Fed on 11.04.2024.
//

import Foundation

struct ItemCastResponseDTO: Decodable {
    let id: Int
    let cast: [CastMemberDTO]
    let crew: [CrewMemberDTO]
    
    struct CastMemberDTO: Decodable {
        let adult: Bool
        let gender: Int?
        let id: Int
        let knownForDepartment: String
        let name: String
        let originalName: String
        let popularity: Double
        let profilePath: String?
        let character: String
        let creditId: String
        let order: Int
    }
    
    struct CrewMemberDTO: Decodable {
        let adult: Bool
        let gender: Int?
        let id: Int
        let knownForDepartment: String
        let name: String
        let originalName: String
        let popularity: Double
        let profilePath: String?
        let creditId: String
        let department: String
        let job: String
    }
}
