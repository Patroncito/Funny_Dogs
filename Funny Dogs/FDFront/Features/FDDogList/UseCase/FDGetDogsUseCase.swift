//
//  FDGetDogsUseCase.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation
class FDGetDogsUseCase {
    private let repository: FDDogRepository
    
    init(repository: FDDogRepository) {
        self.repository = repository
    }
    
    func getDogs() async throws -> [Dog] {
        // Aquí puedes agregar lógica adicional en el futuro si quieres
        return try await repository.fetchDogs()
    }
}
