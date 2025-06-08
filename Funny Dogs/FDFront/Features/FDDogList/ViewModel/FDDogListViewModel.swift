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
            guard !isLoading else { return }
            isLoading = true
            errorMessage = nil
        }

        do {
            let result = try await useCase.getDogs()
            await MainActor.run {
                dogs = result
                isLoading = false
                errorMessage = nil
            }
        } catch {
            await MainActor.run {
                errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }
}
