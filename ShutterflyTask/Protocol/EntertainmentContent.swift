//
//  EntertainmentContent.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

protocol EntertainmentContent: Identifiable, Equatable {
    var id: UUID { get }
    var itemID: Int { get }
    var title: String { get }
    var image: URL? { get }
    var entertainment: Entertainment { get }
    init(id: UUID, itemID: Int, title: String, image: URL?, entertainment: Entertainment)
}

extension EntertainmentContent {
    func setListType(_ listType: Entertainment.ListType) -> Self {
        Self(
            id: id,
            itemID: itemID,
            title: title,
            image: image,
            entertainment: .init(type: entertainment.type, listType: listType)
        )
    }
}
