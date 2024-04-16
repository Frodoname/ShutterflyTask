//
//  MoviesCategoryRow.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct MoviesCategoryRow<T: EntertainmentContent>: View {
    let categoryName: String
    let movies: IdentifiedArray<UUID, T>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title2)
                .padding(.leading)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(movies) { movie in
                        NavigationLink(state: DetailsCore.State(itemID: movie.itemID, contentType: movie.entertainment.type)) {
                            MovieCell(movie: movie)
                                .cornerRadius(8)
                                .padding()
                        }
                        .buttonStyle(.borderless)

                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.bottom)
    }
}
