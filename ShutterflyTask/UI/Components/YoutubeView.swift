//
//  YoutubeView.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct YoutubeView: View {
    let url: URL?
    
    var body: some View {
        if let url {
            WebView(url: url)
        } else {
            Text("Video doesn't exist")
                .foregroundColor(.red)
        }
    }
}
