//
//  FDDogUUIDModel.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation

struct FDDogViewModel: Identifiable {
    let id: String
    let dog: Dog
    
    var dogName: String { dog.dogName }
    var description: String { dog.description }
    var age: Int { dog.age }
    var image: String { dog.image }
    
    init(id: String = UUID().uuidString, dog: Dog) {
        self.id = id
        self.dog = dog
    }
}
