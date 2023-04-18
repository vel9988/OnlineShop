//
//  HomeTabCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 18.04.2023.
//

import UIKit

final class HomeTabCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController
    
    lazy var homeViewController: HomeViewController = {
        let vc = HomeViewController()
        
        return vc
    }()
    
    override init() {
        rootViewController = UINavigationController()
        super.init()
    }
    
    override func start() {
        rootViewController.setViewControllers([homeViewController], animated: false)
    }
    
}
