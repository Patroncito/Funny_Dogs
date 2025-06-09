//
//  FDDogRepository.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

class FDDogRepository {
    let apiClient: FDGenericClient
    private let database = FDDatabase.shared

    init(apiClient: FDGenericClient) {
        self.apiClient = apiClient
    }

    func fetchDogs() async throws -> [FDDogViewModel] {
        do {
            let localDogs = try database.fetchAllDogViewModels()
            if !localDogs.isEmpty {
                print("🐶 Loaded dogs from local DB")
                return localDogs
            }
        } catch {
            print("❌ Error fetching local dogs: \(FDDatabaseError.fetchFailed)")
        }
        guard let url = URL(string: "https://jsonblob.com/api/1151549092634943488") else {
            throw FDAPIError.badURL
        }
        let endpoint = FDSimpleEndpoint(url: url, method: .get)
        let remoteDogs: [Dog] = try await apiClient.request(endpoint: endpoint)
        print("🌐 Loaded dogs from remote API")
        
        do {
            try database.insertDogs(remoteDogs)
            print("💾 Saved remote dogs to local DB")
        } catch {
            print("❌ Error saving dogs to local DB: \(error)")
        }
        let freshDogs = try database.fetchAllDogViewModels()
        return freshDogs
    }

}
