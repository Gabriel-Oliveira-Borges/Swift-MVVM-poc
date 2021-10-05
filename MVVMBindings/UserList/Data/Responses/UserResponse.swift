//
//  UserResponse.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation
import UIKit


struct UserResponse: Decodable {
    let id: Int
    let name: String
    let userName: String
    let email: String
    let address: UserAddressResponse
    let phone: String
    let website: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case userName = "username"
        case email
        case address
        case phone
        case website
    }
}

struct UserAddressResponse: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipCode: String
    
    private enum CodingKeys : String, CodingKey {
        case zipCode = "zipcode"
        case street
        case suite
        case city
    }
}
