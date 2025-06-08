//
//  ContentView.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToList = false
    
    
    // Crear aquí el viewModel (ojo, sin @StateObject porque no es propiedad de la vista, solo para pasar)
    private let viewModel: FDDogListViewModel = {
        let apiClient = FDGenericClient(session: .shared)
        let repository = FDDogRepository(apiClient: apiClient)
        let useCase = FDGetDogsUseCase(repository: repository)
        return FDDogListViewModel(useCase: useCase)
    }()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("¡Bienvenido a Funny Dogs!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button("Continuar") {
                    navigateToList = true
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                
                // Navegación programática
                NavigationLink(
                    destination: FDDogListView(viewModel: viewModel),
                    isActive: $navigateToList,
                    label: { EmptyView() }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
}
