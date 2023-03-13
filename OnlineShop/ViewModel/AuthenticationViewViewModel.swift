//
//  AuthenticationViewViewModel.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 13.03.2023.
//

import Combine
import Foundation

final class AuthenticationViewViewModel: ObservableObject {
    
    @Published var firstName: String?
    @Published var lastName: String?
    @Published var email: String?
    @Published var password: String?
    @Published var isAuthenticationFormValid: Bool = false
    @Published var error: String?
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
