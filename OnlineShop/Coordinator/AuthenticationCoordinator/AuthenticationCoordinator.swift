//
//  AuthenticationCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 20.03.2023.
//

import UIKit

final class AuthenticationCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController
    
    override init() {
        self.rootViewController = UINavigationController()
        super.init()
    }
    
    override func start() {
        let vc = RegisterViewController()
        rootViewController.pushViewController(vc, animated: false)
        vc.viewModel.showLoginScreen = { [weak self] in
            self?.showLoginScreen()
        }
        
        
    }
    
    func showLoginScreen() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .overCurrentContext
        rootViewController.present(vc, animated: true)
    }
    
    
}
