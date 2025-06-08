//
//  FDDogListViewModel.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation
import Combine


class FDDogListViewModel: ObservableObject {
    @Published var dogs: [Dog] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let useCase: FDGetDogsUseCase
    
    init(useCase: FDGetDogsUseCase) {
        self.useCase = useCase
    }
    
    func fetchDogs() async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
            
        }
        
        do {
            let result = try await useCase.getDogs()
            await MainActor.run {
                dogs = result
            }
        } catch {
            await MainActor.run {
                errorMessage = error.localizedDescription
            }
        }
        
        await MainActor.run {
            isLoading = false
        }
    }
}

