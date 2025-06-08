//
//  FDDogRepository.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

class FDDogRepository {
    let apiClient: FDGenericClient

    init(apiClient: FDGenericClient) {
        self.apiClient = apiClient
    }

    func fetchDogs() async throws -> [Dog] {
        guard let url = URL(string: "https://jsonblob.com/api/1151549092634943488") else {
            throw FDAPIError.badURL
        }
        let endpoint = FDSimpleEndpoint(url: url, method: .get)
        return try await apiClient.request(endpoint: endpoint)
    }
}
