//
//  SafeAPICall.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 05/10/21.
//

import Foundation

enum SafeAPICallError: Error {
    case InvalidURL
    case NetworkError
}

func safeAPICall<T: Decodable>(url: String) async -> Result<T, SafeAPICallError> {
    guard let url = URL(string: url) else {
        return Result.failure(SafeAPICallError.InvalidURL)
    }
    let urlRequest = URLRequest(url: url)
    do {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        
        return Result.success(decoded)
    } catch {
        print(error)
        return Result.failure(SafeAPICallError.NetworkError)
    }
}
