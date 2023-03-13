//
//  MainTabBarViewController.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 11.03.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let favouritesVC = UINavigationController(rootViewController: FavouritesViewController())
        let shoppingCartVC = UINavigationController(rootViewController: ShoppingCartViewController())
        let chatVC = UINavigationController(rootViewController: ChatViewController())
        let userAccountVC = UINavigationController(rootViewController: UserAccountViewController())

        homeVC.tabBarItem.image = R.Image.TabBar.home
        favouritesVC.tabBarItem.image = R.Image.TabBar.favourites
        shoppingCartVC.tabBarItem.image = R.Image.TabBar.shoppingCart
        chatVC.tabBarItem.image = R.Image.TabBar.chat
        userAccountVC.tabBarItem.image = R.Image.TabBar.profile
        
        setViewControllers([homeVC, favouritesVC, shoppingCartVC, chatVC, userAccountVC], animated: true)
        
    }


}

