//
//  ContentView.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToList = false

    private let viewModel: FDDogListViewModel = {
        let apiClient = FDGenericClient(session: .shared)
        let repository = FDDogRepository(apiClient: apiClient)
        let useCase = FDGetDogsUseCase(repository: repository)
        return FDDogListViewModel(useCase: useCase)
    }()

    var body: some View {
        NavigationView {
            ZStack {
                FDWelcomeView {
                    navigateToList = true
                }

                NavigationLink(
                    destination: FDDogListView(viewModel: viewModel),
                    isActive: $navigateToList,
                    label: {
                        EmptyView()
                    }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
