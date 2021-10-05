//
//  UserRepository.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

enum GenericError: Error {
    case Unknown
}

class UserRepository {
    private let remoteDataSource = RemoteDataSource()
    private let userResponseToUserMapper = UserResponseToUserMapper()

    func getUsers() async -> Result<[User], Error> {
        switch await remoteDataSource.getUsers() {
            case .success(let users): return Result.success(
                users.map { user in
                    userResponseToUserMapper.mapFrom(from: user)
                }
            )
            default:
                return Result.failure(GenericError.Unknown)
        }
    }
}
