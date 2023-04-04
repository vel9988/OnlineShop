//
//  AuthenticationCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 20.03.2023.
//

import UIKit

final class AuthenticationCoordinator: Coordinator {
    
    var rootViewController: UIViewController
    
    init() {
        self.rootViewController = UIViewController()
    }
    
    func start() {
        rootViewController = RegisterViewController()
    }
    
    
}
