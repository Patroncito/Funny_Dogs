//
//  APIError.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

enum FDAPIError: Error, LocalizedError {
    case invalidResponse
    case httpStatusCode(Int)
    case decodingError(Error)
    case badURL
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Respuesta Invalida del Servidor"
        case .httpStatusCode(let code):
            return "Error HTTP \(code)"
        case .decodingError(let error):
            return "Error al decodificar \(error.localizedDescription)"
        case .badURL:
            return "La URL tiene un problema"
        }
    }
    
}
