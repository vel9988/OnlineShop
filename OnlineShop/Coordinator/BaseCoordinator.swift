//
//  BaseCoordinator.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 18.04.2023.
//

import Foundation

class BaseCoordinator : Coordinator {
    var childCoordinators : [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
}
