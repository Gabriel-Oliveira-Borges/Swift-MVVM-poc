//
//  UserDetailsViewModel.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 05/10/21.
//

import Foundation

class UserDetailViewModel {
    let viewState = UserDetailViewState()
    
    func dispatchViewModelAction(action: UserDetailViewModelAction) {
        switch action {
            case .setUser(let user): viewState.user.onNext(user)
        }
    }
}
