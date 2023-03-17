//
//  LoginViewController.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 16.03.2023.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = AuthenticationViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Subviews
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome back"
        label.font = R.Font.montserrat(type: .medium, size: 26)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = C.cornerRadiusTextFields
        textField.backgroundColor = R.Color.textField
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: R.Color.grayText,
                         NSAttributedString.Key.font: R.Font.montserrat(type: .medium, size: 12)]
        )
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = C.cornerRadiusTextFields
        textField.backgroundColor = R.Color.textField
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: R.Color.grayText,
                         NSAttributedString.Key.font: R.Font.montserrat(type: .medium, size: 12)]
        )
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = R.Font.montserrat(type: .bold, size: 16)
        button.backgroundColor = R.Color.universalBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        setupSubviews()
        addGesture()
        bindViews()
        configureConstraints()
        
    }

}

//MARK: - Setups

private extension LoginViewController {
    
    func setupVC() {
        view.backgroundColor = R.Color.background
    }
    
    func setupSubviews() {
        view.addSubview(loginTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    func addGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
    }
    
    func bindViews() {
        emailTextField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        viewModel.$isAuthenticationFormValid.sink { [weak self] validationState in
            self?.loginButton.isEnabled = validationState
        }
        .store(in: &subscriptions)
        
        viewModel.$error.sink { [weak self] errorString in
            guard let error = errorString else { return }
            self?.presentAlert(with: error)
        }
        .store(in: &subscriptions)
    }
    
}

//MARK: - Action

private extension LoginViewController {
    
    func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }
    
    @objc func didTapToDismiss() {
        view.endEditing(true)
    }
    
    @objc func didChangeEmailField() {
        viewModel.email = emailTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc func didChangePasswordField() {
        viewModel.password = passwordTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc func didTapLogin() {
        
    }
    
}

//MARK: - Constants

private extension LoginViewController {
    typealias C = Constants
    
    enum Constants {
        static let registerTextFieldsHeight: CGFloat = 30
        static let registerTextFieldsWidth: CGFloat = 289
        static let registerButtonHeight: CGFloat = 50
        static let registerButtonWidth: CGFloat = 289
        static let cornerRadiusTextFields: CGFloat = 15
        static let cornerRadiusRegisterButton: CGFloat = 25
    }
    
}


//MARK: - Configure constraints

private extension LoginViewController {
    
    func configureConstraints() {
        let loginTitleLabelConstraints = [
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: 70),
            emailTextField.heightAnchor.constraint(equalToConstant: C.registerTextFieldsHeight),
            emailTextField.widthAnchor.constraint(equalToConstant: C.registerTextFieldsWidth)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: C.registerTextFieldsHeight),
            passwordTextField.widthAnchor.constraint(equalToConstant: C.registerTextFieldsWidth)
        ]
        
        let loginButtonConstraints = [
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: C.registerButtonHeight),
            loginButton.widthAnchor.constraint(equalToConstant: C.registerButtonWidth)
        ]
        
        NSLayoutConstraint.activate(loginTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)

    }
    
}

