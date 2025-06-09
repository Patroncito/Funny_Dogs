//
//  FDDatabase.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import SQLite
import SwiftUI
    
final class FDDatabase {
    typealias SQLExpression<T> = SQLite.Expression<T>
    
    static let shared = FDDatabase()
    
    private var db: Connection?
    private let dogsTable = Table("dogs")
    private let id = SQLExpression<String>("id")
    private let dogName = SQLExpression<String>("dogName")
    private let description = SQLExpression<String>("description")
    private let age = SQLExpression<Int64>("age")
    private let image = SQLExpression<String>("image")
    
    private init() {
        initializeDatabase()
    }
    
    private func initializeDatabase() {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ Failed to find documents directory.")
            return
        }
        
        let dbPath = "\(path)/FunnyDogs.sqlite"
        print("📂 Database path: \(dbPath)")
        
        do {
            db = try Connection(dbPath)
            createTableIfNeeded()
        } catch {
            db = nil
            print("❌ Failed to initialize database:", FDDatabaseError.connectionFailed)
        }
    }
    
    private func createTableIfNeeded() {
        do {
            try db?.run(dogsTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: true)
                t.column(dogName)
                t.column(description)
                t.column(age)
                t.column(image)
            })
            print("✅ Tables created or already exist.")
        } catch {
            print("❌ Error creating table:", FDDatabaseError.tableCreationFailed)
        }
    }
}

extension FDDatabase {
    /// Guarda cada perro en la BD
    func insertDog(_ dog: Dog) throws {
        guard let db = db else {
            throw FDDatabaseError.connectionFailed
        }
        
        do {
            let insert = dogsTable.insert(
                id <- UUID().uuidString,
                dogName <- dog.dogName,
                description <- dog.description,
                age <- Int64(dog.age),
                image <- dog.image
            )
            try db.run(insert)
            print("✅ Inserted dog: \(dog.dogName)")
        } catch {
            print("❌ Error inserting dog:", error)
            throw FDDatabaseError.insertionFailed
        }
    }
    /// Guarda todos los  perros en la BD
    func insertDogs(_ dogs: [Dog]) throws {
        for dog in dogs {
            try insertDog(dog)
        }
    }
    
    /// Obtiene todos los perros almacenados en la base de datos con el JSON del servicio
    func fetchAllDogs() throws -> [Dog] {
        guard let db = db else {
            throw FDDatabaseError.connectionFailed
        }
        
        var dogs: [Dog] = []
        
        do {
            for dogRow in try db.prepare(dogsTable) {
                let dog = Dog(
                    dogName: dogRow[dogName],
                    description: dogRow[description],
                    age: Int(dogRow[age]),
                    image: dogRow[image]
                )
                dogs.append(dog)
            }
            return dogs
        } catch {
            throw FDDatabaseError.fetchFailed
        }
    }
    
    /// Obtiene todos los perros de la base de datos con su propio Identificador SQL
    func fetchAllDogViewModels() throws -> [FDDogViewModel] {
        guard let db = db else {
            throw FDDatabaseError.connectionFailed
        }
        var dogViewModels: [FDDogViewModel] = []
        
        for dogRow in try db.prepare(dogsTable) {
            let dog = Dog(
                dogName: dogRow[dogName],
                description: dogRow[description],
                age: Int(dogRow[age]),
                image: dogRow[image]
            )
            let dogVM = FDDogViewModel(id: dogRow[id], dog: dog)
            dogViewModels.append(dogVM)
        }
        return dogViewModels
    }

    
    /// Elimina todos los perros de la base de datos
    func deleteAllDogs() throws {
        guard let db = db else {
            throw FDDatabaseError.connectionFailed
        }
        
        do {
            try db.run(dogsTable.delete())
            print("✅ All dogs deleted")
        } catch {
            throw FDDatabaseError.deletionFailed
        }
    }
}
