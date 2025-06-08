//
//  FDImageLDogView.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SwiftUI

struct FDImageLDogView: View {
    var dogImageURL: URL?

    var body: some View {
        AsyncImage(url: dogImageURL?.scaledWikiaImageURL(width: 220)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: 220)
            case let .success(image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 220)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 220)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    FDImageLDogView(dogImageURL: URL(string: "https://static.wikia.nocookie.net/isle-of-dogs/images/1/1d/Chief-0.jpg/revision/latest/scale-to-width-down/666?cb=20180624184431")?.scaledWikiaImageURL(width: 220))
}
