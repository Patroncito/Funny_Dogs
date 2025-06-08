//
//  FDDogListView.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SwiftUI

struct FDDogListView: View {
    @StateObject private var viewModel: FDDogListViewModel

    init(viewModel: FDDogListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.dogs, id: \.dogName) { dog in
                        FDDogCellView(
                            name: dog.dogName,
                            description: dog.description,
                            age: dog.age,
                            image: dog.image
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("Dogs We Love")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchDogs()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .alert("Error", isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
            .background(.fdLightWhite)
        
    }
}

#Preview {
    let apiClient = FDGenericClient(session: .shared)
    let repository = FDDogRepository(apiClient: apiClient)
    let useCase = FDGetDogsUseCase(repository: repository)
    let viewModel = FDDogListViewModel(useCase: useCase)
    FDDogListView(viewModel: viewModel)
}

