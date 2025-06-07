//
//  ApiClient.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

final class FDGenericClient {
    private let session : URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request<T>(endpoint: FDEndpoint) async throws -> T where T:Decodable {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw FDAPIError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw FDAPIError.httpStatusCode(httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw FDAPIError.decodingError(error)
        }
    }

}
