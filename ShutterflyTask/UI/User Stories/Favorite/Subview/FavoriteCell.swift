//
//  FavoriteCell.swift
//  ShutterflyTask
//
//  Created by Fed on 16.04.2024.
//

import Kingfisher
import SwiftUI

struct FavoriteCell: View {
    let details: EntertainmentDetailsBundle
    
    var body: some View {
        HStack {
            KFImage(details.mainDetails.image)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .shadow(radius: 3)
            
            VStack(alignment: .leading) {
                Text(details.mainDetails.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(details.mainDetails.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
