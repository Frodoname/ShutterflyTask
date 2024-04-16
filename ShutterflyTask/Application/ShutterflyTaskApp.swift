//
//  ShutterflyTaskApp.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct ShutterflyTaskApp: App {
    static let store = Store(initialState: TabsCore.State()) {
        TabsCore()
    }
    
    var body: some Scene {
        WindowGroup {
            TabsView(store: ShutterflyTaskApp.store)
        }
    }
}
