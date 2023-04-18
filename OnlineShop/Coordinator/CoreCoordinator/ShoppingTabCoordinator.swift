//
//  ShoppingTabCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 18.04.2023.
//

import UIKit

final class ShoppingTabCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController
    
    lazy var shoppingViewController: ShoppingCartViewController = {
        let vc = ShoppingCartViewController()
        
        return vc
    }()
    
    override init() {
        rootViewController = UINavigationController()
        super.init()
    }
    
    override func start() {
        rootViewController.setViewControllers([shoppingViewController], animated: false)
    }
    
}
