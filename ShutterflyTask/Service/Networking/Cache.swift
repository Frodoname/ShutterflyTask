//
//  Cache.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Foundation

final class EntertainmentDetailsCache {
    static let shared = EntertainmentDetailsCache()
    private let queue = DispatchQueue(label: "ShutterflyTask.teodor.com-entertainmentCache", attributes: .concurrent)
    private var registry: [Int: EntertainmentDetailsBundle] = [:]

    private init() { }

    func set(_ value: EntertainmentDetailsBundle) {
        queue.async(flags: .barrier) {
            self.registry[value.mainDetails.itemID] = value
        }
    }
    
    func get(_ value: Int) -> EntertainmentDetailsBundle? {
        queue.sync {
            self.registry[value]
        }
    }

    func delete(_ value: EntertainmentDetailsBundle) -> Bool {
        queue.sync(flags: .barrier) {
            guard let _ = self.registry[value.mainDetails.itemID] else {
                return false
            }
            self.registry.removeValue(forKey: value.mainDetails.itemID)
            return true
        }
    }

    func getAllData() -> [EntertainmentDetailsBundle] {
        queue.sync {
            Array(self.registry.values)
        }
    }

    func removeAllData() {
        queue.async(flags: .barrier) {
            self.registry.removeAll()
        }
    }
}
