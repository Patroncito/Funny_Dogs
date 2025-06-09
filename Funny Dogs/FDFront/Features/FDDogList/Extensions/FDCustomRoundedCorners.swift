//
//  FDCustomCornerRadius.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SwiftUI
/// Extensión que permite redondear esquinas específicas
struct FDCustomRoundedCorners: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
