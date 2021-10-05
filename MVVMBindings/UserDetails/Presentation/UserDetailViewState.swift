//
//  UserDetailViewState.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 05/10/21.
//

import Foundation
import RxSwift

struct UserDetailViewState {
    var user = BehaviorSubject<User?>(value: nil)
}
