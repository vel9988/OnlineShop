//
//  AppCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 20.03.2023.
//

import Combine
import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
//    func start() {
//        let mainCoordinator = MainCoordinator()
//        mainCoordinator.start()
//        self.window.rootViewController = mainCoordinator.rootViewController
//    }
    
    func start() {
        let authCoordinator = AuthenticationCoordinator()
        authCoordinator.start()
        self.window.rootViewController = authCoordinator.rootViewController
    }
}
