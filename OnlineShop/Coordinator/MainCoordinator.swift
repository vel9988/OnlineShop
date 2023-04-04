//
//  MainCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 20.03.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    
    init() {
        self.rootViewController = UITabBarController()
        
    }
    
    func start() {
        self.rootViewController = MainTabBarViewController()
    }
}
