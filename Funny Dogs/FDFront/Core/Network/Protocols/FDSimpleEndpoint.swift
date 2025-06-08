//
//  FDSimpleEndpoint.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

struct FDSimpleEndpoint: FDEndpoint {
    var url: URL
    var method: HTTPMethod
    var headers: [String : String]? = nil
    var body: Data? = nil
}
