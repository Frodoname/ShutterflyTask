//
//  FavoriteView.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture
import SwiftUI

struct FavouritesView: View {
    let store: StoreOf<FavoritesCore>
    
    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: \.path)) {
            Group {
                if let favoriteList = store.favoriteList, !favoriteList.isEmpty {
                    List {
                        ForEach(favoriteList, id: \.mainDetails.itemID) { details in
                            NavigationLink(state: DetailsCore.State(itemID: details.mainDetails.itemID, contentType: .movie)) {
                                FavoriteCell(details: details)
                            }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    Text(Texts.listIsEmpty)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle(Texts.favorite)
            .onAppear {
                store.send(.getFavoritesList)
            }
        } destination: { store in
            DetailsView(store: store)
        }
    }
}
