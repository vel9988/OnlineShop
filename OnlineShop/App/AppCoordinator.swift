//
//  AppCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 20.03.2023.
//

import Combine
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    
    let window: UIWindow
    let isShowRegistration = CurrentValueSubject<Bool,Never>(true)
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        
//        setupRegisterValue()
//        isShowRegistration
//            .removeDuplicates()
//            .sink { [weak self] state in
//                if state {
//                    self?.startMain()
//                } else {
//                    self?.startAuth()
//                }
//            }
//            .store(in: &subscriptions)
        
//        startMain()
        startAuth()
    }
    
    private func startMain() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.store(coordinator: mainCoordinator)
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    private func startAuth() {
        let authCoordinator = AuthenticationCoordinator()
        authCoordinator.start()
        self.childCoordinators = [authCoordinator]
        self.window.rootViewController = authCoordinator.rootViewController
    }
    
    func setupRegisterValue() {
                
        let key = "isShowRegistration"
        let value = UserDefaults.standard.bool(forKey: key)
        isShowRegistration.send(value)
        
        isShowRegistration
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
        
    }
    
}
