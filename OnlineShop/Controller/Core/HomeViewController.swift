//
//  HomeViewController.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 11.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties

    private var viewModel = HomeViewViewModel()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleAuthentication()
    }
    
}

//MARK: - Private func
private extension HomeViewController {
    
    func handleAuthentication() {
        if viewModel.user == nil {
            let vc = UINavigationController(rootViewController: RegisterViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
}
