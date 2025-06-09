//
//  ImageScalingUtils.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

extension URL {
    func scaledWikiaImageURL(width: Int) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        guard var pathComponents = components?.path.split(separator: "/").map(String.init) else {
            return nil
        }
        /// Remplaza "scale-to-width-down"
        if let index = pathComponents.firstIndex(of: "scale-to-width-down") {
            if index + 1 < pathComponents.count {
                pathComponents[index + 1] = "\(width)"
            }
        } else {
            pathComponents.append("scale-to-width-down")
            pathComponents.append("\(width)")
        }
        components?.path = "/" + pathComponents.joined(separator: "/")
        return components?.url
    }
}
