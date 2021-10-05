//
//  UserDetailsViewController.swift
//  MVVMBindings
//
//  Created by Gabriel Oliveira Borges on 05/10/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class UserDetailViewController: UIViewController {
    static let storyboardId = "USER_DETAIL_VIEW_CONTROLLER"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!

    lazy private var viewModel = UserDetailViewModel()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        observeUser()
    }
    
    func setUser(_ user: User) {
        viewModel.dispatchViewModelAction(action: .setUser(user: user))
    }
    
    private func observeUser() {
        viewModel.viewState.user.subscribe(onNext: { user in
            if let user = user {
                self.nameLabel.text = "\(user.name)"
                self.userNameLabel.text = "\(user.userName)"
                self.emailLabel.text = "Email: \(user.email)"
                self.phoneLabel.text = "Celular: \(user.phone)"
                self.cityLabel.text = "Cidade: \(user.city)"
                self.websiteLabel.text = "Site: \(user.website)"
            }
        }).disposed(by: bag)
    }
}
