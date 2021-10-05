//
//  UserResponseToUserMapper.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation

class UserResponseToUserMapper: BaseMapper{
    typealias SOURCE = UserResponse
    typealias DESTINATION = User
    
    func mapFrom(from: UserResponse) -> User {
        return User(
            name: from.name,
            userName: from.userName,
            email: from.email,
            phone: from.phone,
            city: from.address.city,
            website: from.website
        )
    }
}
