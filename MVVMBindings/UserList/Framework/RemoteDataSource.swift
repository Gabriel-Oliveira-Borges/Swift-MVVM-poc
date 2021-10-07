//
//  RemoteDataSource.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation

class RemoteDataSource {
    private let session = URLSession.shared
    func getUsers() async -> Result<[UserResponse], Error> {
        return await safeAPICall(url: "https://jsonplaceholder.typicode.com/users").mapError({ safeAPIError in
            safeAPIError as Error
        })
    }
}
