//
//  Dog.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 07/06/25.
//

import Foundation


struct DogResponse : Codable {
    let dogsListResponse : [Dog]
}
struct Dog : Codable {
    let dogName : String
    let description : String
    let age : Int
    let image : String
}
