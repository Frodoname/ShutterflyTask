//
//  CastMember.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct CastMember {
    let id: UUID
    let name: String
    let characterName: String
    let image: URL?
    
    init(model: ItemCastResponseDTO.CastMemberDTO) {
        self.id = .init()
        self.name = model.originalName
        self.characterName = model.character
        self.image = ImageURLBuilder.buildURL(forPath: model.profilePath)
    }
}

extension CastMember: Identifiable, Equatable { }

extension Array where Element == CastMember {
    init(dtoModel: ItemCastResponseDTO) {
        self.init()
        for dto in dtoModel.cast {
            let review = CastMember(model: dto)
            self.append(review)
        }
    }
}
