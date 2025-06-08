//
//  DogCellView.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SwiftUI

struct FDDogCellView: View {
    var name: String
    var description: String
    var age: Int
    var image: String

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            FDImageLDogView(dogImageURL: URL(string: image))
                .frame(width: 150, height: 220)
            VStack(alignment: .leading, spacing: 12) {
                Text(name)
                    .font(.largeTitle)
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.fdLightGray)
                    .lineLimit(3)
                Text("Almost \(age) years")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .clipShape(FDCustomRoundedCorners(radius: 8, corners: [.bottomRight, .topRight]))
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .frame(minHeight: 140)
    }
}

#Preview {
    FDDogCellView(name: "Chief", description: "He is much more passive and is the first to suggest to rescue and not eat The Little Pilot", age: 5, image: "https://static.wikia.nocookie.net/isle-of-dogs/images/a/af/Rex.jpg/revision/latest/scale-to-width-down/666?cb=20180625001634")
        .background(Color.red) // Primer fondo
}
