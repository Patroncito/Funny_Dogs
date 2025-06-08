//
//  EndpointProcol.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

protocol FDEndpoint {
    var url: URL { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

extension FDEndpoint {
    var headers: [String: String]? { nil }
    var body: Data? { nil }
}
