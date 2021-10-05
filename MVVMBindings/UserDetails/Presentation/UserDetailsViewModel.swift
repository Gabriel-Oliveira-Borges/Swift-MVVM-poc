//
//  UserDetailsViewModel.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 05/10/21.
//

import Foundation

class UserDetailViewModel: BaseViewModel<UserDetailViewState, UserDetailViewModelAction> {
    
    init() {
        super.init(viewState: UserDetailViewState())
    }
    
    override func dispatchViewModelAction(action: UserDetailViewModelAction) {
        switch action {
            case .setUser(let user): viewState.user.onNext(user)
        }
    }
}
