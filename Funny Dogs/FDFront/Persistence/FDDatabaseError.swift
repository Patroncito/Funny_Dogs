//
//  FDDatabaseError.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

enum FDDatabaseError: Error, LocalizedError {
    case connectionFailed
    case tableCreationFailed
    case insertionFailed
    case fetchFailed
    case updateFailed
    case deletionFailed
    case recordNotFound
    case invalidData
    case unknownError(Error)

    var errorDescription: String? {
        switch self {
        case .connectionFailed:
            return "No se pudo establecer conexión con la base de datos."
        case .tableCreationFailed:
            return "Error al crear la tabla en la base de datos."
        case .insertionFailed:
            return "No se pudo insertar el registro en la base de datos."
        case .fetchFailed:
            return "Error al recuperar los datos de la base de datos."
        case .updateFailed:
            return "No se pudo actualizar el registro en la base de datos."
        case .deletionFailed:
            return "No se pudo eliminar el registro de la base de datos."
        case .recordNotFound:
            return "No se encontró el registro solicitado."
        case .invalidData:
            return "Los datos proporcionados no son válidos."
        case .unknownError(let error):
            return "Ocurrió un error inesperado: \(error.localizedDescription)"
        }
    }
}
