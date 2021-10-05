//
//  UserListViewState.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation
import RxSwift

// Essa struct deve guardar todas as variáveis utilizadas pelo ViewController.
// As variáveis não ficam no próprio ViewModel por questão de melhor entendimento
// de quais variáveis o ViewModel expõe para a ViewController e também para não
// misturar essas variáveis com as variáveis utilizadas apenas no próprio viewModel

struct UserListViewState {
    var users = BehaviorSubject<[User]>(value: [])
    var usersOrNil: [User]? {
        get {
            return try? users.value()
        }
    }
    var notification = PublishSubject<Notification>()
}


enum Notification {
    case ShowGenericAlert(title: String, message: String)
}
