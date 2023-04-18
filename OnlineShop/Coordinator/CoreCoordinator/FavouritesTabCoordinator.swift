//
//  FavouritesTabCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 18.04.2023.
//

import UIKit

final class FavouritesTabCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController
    
    lazy var favouritesViewController: FavouritesViewController = {
        let vc = FavouritesViewController()
        
        return vc
    }()
    
    override init() {
        rootViewController = UINavigationController()
        super.init()
    }
    
    override func start() {
        rootViewController.setViewControllers([favouritesViewController], animated: false)
    }
    
}
