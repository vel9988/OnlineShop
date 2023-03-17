//
//  AuthenticationViewViewModel.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 13.03.2023.
//

import Combine
import Foundation

final class AuthenticationViewViewModel: ObservableObject {
    
    //MARK: - Properties

    @Published var firstName: String?
    @Published var lastName: String?
    @Published var email: String?
    @Published var password: String?
    @Published var user: User?
    @Published var isAuthenticationFormValid: Bool = false
    @Published var error: String?
    
    //MARK: - Private properties

    private var isDuplicateEmail: Bool = true
    
    //MARK: - Func
    
    func validateAuthenticationForm() {
        guard let firstName = firstName,
              let lastName = lastName,
              let email = email,
              let password = password else {
            isAuthenticationFormValid = false
            return
        }
        isAuthenticationFormValid = firstName.count >= 2 && lastName.count >= 2 && isValidEmail(email) && password.count >= 8
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let firstName = firstName,
              let lastName = lastName,
              let email = email,
              let password = password else { return }
        isDuplicateEmail = DatabaseManager.shared.isRegisterUserFrom(email: email)
        if !isDuplicateEmail {
            let user = UserApp(firstName: firstName, lastName: lastName, email: email, password: password)
            DatabaseManager.shared.collectionUsers(add: user)
        } else {
            error = "Пользователь с такими данными уже существует"
        }
        
        
    }
    
    
}
