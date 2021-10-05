//
//  BaseMappers.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation

protocol BaseMapper {
    associatedtype SOURCE
    associatedtype DESTINATION
    func mapFrom(from: SOURCE) -> DESTINATION
}
