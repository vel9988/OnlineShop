//
//  MainCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 20.03.2023.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    
    var rootViewController: UITabBarController
    
    override init() {
        rootViewController = UITabBarController()
        rootViewController.tabBar.layer.cornerRadius = 30
        rootViewController.tabBar.layer.masksToBounds = true
        rootViewController.tabBar.backgroundColor = .white
        super.init()
    }
    
    override func start() {
        let homeCoordinator = HomeTabCoordinator()
        homeCoordinator.start()
        self.store(coordinator: homeCoordinator)
        let homeVC = homeCoordinator.rootViewController
        homeVC.tabBarItem.image = R.Image.TabBar.home
        
        let favouritesCoordinator = FavouritesTabCoordinator()
        favouritesCoordinator.start()
        self.store(coordinator: favouritesCoordinator)
        let favouritesVC = favouritesCoordinator.rootViewController
        favouritesVC.tabBarItem.image = R.Image.TabBar.favourites
        
        let shoppingCoordinator = ShoppingTabCoordinator()
        shoppingCoordinator.start()
        self.store(coordinator: shoppingCoordinator)
        let shoppingVC = shoppingCoordinator.rootViewController
        shoppingVC.tabBarItem.image = R.Image.TabBar.shoppingCart
        
        let chatCoordinator = ChatTabCoordinator()
        chatCoordinator.start()
        self.store(coordinator: chatCoordinator)
        let chatVC = chatCoordinator.rootViewController
        chatVC.tabBarItem.image = R.Image.TabBar.chat
        
        let userCoordinator = UserTabCoordinator()
        userCoordinator.start()
        self.store(coordinator: userCoordinator)
        let userVC = userCoordinator.rootViewController
        userVC.tabBarItem.image = R.Image.TabBar.profile
        
        rootViewController.viewControllers = [homeVC, favouritesVC, shoppingVC, chatVC, userVC]
    }
}

