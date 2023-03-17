//
//  HomeViewViewModel.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 16.03.2023.
//

import Combine
import Foundation

final class HomeViewViewModel: ObservableObject {
    
    @Published var user: UserApp?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    func retrieveUser() {
        
    }
    
}
