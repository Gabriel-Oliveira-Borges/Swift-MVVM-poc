//
//  UserListViewModel.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 03/10/21.
//
import Foundation

class UserListViewModel : BaseViewModel<UserListViewState, UserListViewModelAction> {
    private let userRepository = UserRepository()
    
    init() {
        super.init(viewState: UserListViewState())
    }
    
    override func dispatchViewModelAction(action: UserListViewModelAction) {
        switch action {
            case .Init: onInit()
        }
    }
    
    private func fetchUsers() {
        Task.init(priority: .background) {
            switch await self.userRepository.getUsers() {
                case .success(let users): self.viewState.users.onNext(users)
                case .failure: self.viewState.notification.onNext(.ShowGenericAlert(title: "Erro", message: "Ocorreu um erro ao pegar os usuarios"))
            }
        }
    }
    
    private func onInit() {
        fetchUsers()
        sendErrorMessage()
    }
    
    private func sendErrorMessage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.viewState.notification.onNext(.ShowGenericAlert(title: "Alerta", message: "Alerta enviado para mostrar como o ViewModel se comunica com a ViewController"))
        }
    }
}
