//
//  BaseViewModel.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation

class BaseViewModel<S, A> {
    var viewState: S
    
    init(viewState: S) {
        self.viewState = viewState
    }
    
    open func dispatchViewModelAction(action: A) {}
}
