//
//  UserTabCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 18.04.2023.
//

import UIKit

final class UserTabCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController
    
    lazy var userAccountViewController: UserAccountViewController = {
        let vc = UserAccountViewController()
        
        return vc
    }()
    
    override init() {
        rootViewController = UINavigationController()
        super.init()
    }
    
    override func start() {
        rootViewController.setViewControllers([userAccountViewController], animated: false)
    }
    
}
