//
//  FDDogListViewModel.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Combine
import Foundation

class FDDogListViewModel: ObservableObject {
    @Published var dogs: [FDDogViewModel] = []
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
            let dogResponseModels = result.map { FDDogViewModel(dog: $0) }
            await MainActor.run {
                dogs = dogResponseModels
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
