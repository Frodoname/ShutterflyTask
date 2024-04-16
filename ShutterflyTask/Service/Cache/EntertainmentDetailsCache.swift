//
//  EntertainmentDetailsCache.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

final class EntertainmentDetailsCache {
    static let shared = EntertainmentDetailsCache()
    private let queue = DispatchQueue(label: "ShutterflyTask.teodor.com-entertainmentCache", attributes: .concurrent)
    private var cache: [Int: EntertainmentDetailsBundle] = [:]

    private init() { }

    func set(_ value: EntertainmentDetailsBundle) {
        queue.async(flags: .barrier) {
            self.cache[value.mainDetails.itemID] = value
        }
    }
    
    func get(_ value: Int) -> EntertainmentDetailsBundle? {
        queue.sync {
            self.cache[value]
        }
    }

    func getAllData() -> [EntertainmentDetailsBundle] {
        queue.sync {
            Array(self.cache.values)
        }
    }

    func removeAllData() {
        queue.async(flags: .barrier) {
            self.cache.removeAll()
        }
    }
}
