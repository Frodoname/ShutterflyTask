//
//  ContentView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(Texts.cast)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
