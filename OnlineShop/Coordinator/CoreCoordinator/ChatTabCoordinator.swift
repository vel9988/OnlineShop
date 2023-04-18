//
//  ChatTabCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 18.04.2023.
//

import UIKit

final class ChatTabCoordinator: BaseCoordinator {
    
    var rootViewController: UINavigationController
    
    lazy var chatViewController: ChatViewController = {
        let vc = ChatViewController()
        
        return vc
    }()
    
    override init() {
        rootViewController = UINavigationController()
        super.init()
    }
    
    override func start() {
        rootViewController.setViewControllers([chatViewController], animated: false)
    }
    
}
