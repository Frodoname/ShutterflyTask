//
//  DetailsView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import Kingfisher
import SwiftUI

struct DetailsView: View {
    @Bindable var store: StoreOf<DetailsCore>
    
    var body: some View {
        Group {
            if let details = store.state.details {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(details.mainDetails.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                            Button {
                                store.send(.toggleFavorite)
                            } label: {
                                Image(systemName: details.mainDetails.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(details.mainDetails.isFavorite ? .red : .gray)
                            }
                        }
                        KFImage(details.mainDetails.image)
                            .placeholder { _ in
                                ProgressView()
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 200, height: 200)
                        HStack {
                            Text(String(format: "%.1f", details.mainDetails.rating))
                                .fontWeight(.semibold)
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        Text(Texts.overView)
                            .font(.headline)
                        Text(details.mainDetails.overview)
                        if let trailerURL = details.trailerURL {
                            Text(Texts.trailer)
                                .font(.headline)
                            YoutubeView(url: trailerURL)
                                .frame(height: 200)
                        }
                        Text(Texts.cast)
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(details.cast) { castMember in
                                    VStack {
                                        KFImage(castMember.image)
                                            .placeholder { _ in
                                                ProgressView()
                                            }
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                        Text(castMember.name)
                                            .font(.caption)
                                        Text(castMember.characterName)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        Text(Texts.reviews)
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(details.reviews) { review in
                                    VStack(alignment: .leading) {
                                        Text(review.author)
                                            .fontWeight(.bold)
                                        Text(review.content)
                                            .lineLimit(4)
                                    }
                                    .frame(width: 250)
                                    .padding()
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(8)
                                }
                            }
                        }
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            store.send(.fetchItemDetails)
        }
    }
}
