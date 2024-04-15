//
//  Array+Extension.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

extension Array where Element: EntertainmentContent {
    func setListType(_ listType: Entertainment.ListType) -> Self {
        map { $0.setListType(listType) }
    }
}
