//
//  UserListViewController.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 03/10/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    lazy private var viewModel = UserListViewModel()
    private let bag = DisposeBag()

    override func viewDidLoad() {
//        bindTableView()
        observeUsers()
        
        observeNotifications()
        viewModel.dispatchViewModelAction(action: .Init)
    }
    
    private func observeNotifications() {
        viewModel.viewState.notification.subscribe(onNext: {[weak self] notification in
            switch notification {
                case .ShowGenericAlert(let title, let message): self?.showAlert(title, message)
            }
        }).disposed(by: bag)
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }
    
    //MARK: - Usando RxSwift para atualizar a tableView quando o array de usuarios muda
    private func observeUsers() {
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.viewState.users.subscribe(onNext: { [weak self] users in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }).disposed(by: bag)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = viewModel.viewState.usersOrNil?[indexPath.row] else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewState.usersOrNil?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let user = viewModel.viewState.usersOrNil?[indexPath.row]
        self.navigateToUserDetail(selectedUser: user!)
    }
    
    
    //MARK: - Usando RxSwift para atualizar a tableview automaticamente
    private func bindTableView() {
        viewModel.viewState.users.bind(
            to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = model.email
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(User.self).subscribe(onNext: { [weak self] user in
            self?.navigateToUserDetail(selectedUser: user)
        }).disposed(by: bag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            self?.tableView.deselectRow(at: indexPath, animated: true)
        }).disposed(by: bag)
    }
    
    func navigateToUserDetail(selectedUser: User) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: UserDetailViewController.storyboardId) as? UserDetailViewController
        vc?.setUser(selectedUser)
        present(vc!, animated: true)
    }
}
