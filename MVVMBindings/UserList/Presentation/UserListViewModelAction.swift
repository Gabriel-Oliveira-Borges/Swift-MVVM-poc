//
//  UserListViewAction.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 04/10/21.
//

import Foundation

// Esse enum deve ser o meio de comunicação entre a ViewController e o ViewModel
// Para isso acontecer, quando a ViewController quiser comunicar algo ao ViewModel
// ela deve utilizar o método `dispatchViewModelAction` da ViewModel, passando
// por parâmetro algum dos `cases` desse enum
enum UserListViewModelAction {
    case Init
}
