//
//  RegisterViewController.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 12.03.2023.
//

import UIKit
import Combine

final class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = AuthenticationViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Subviews
    
    private let registerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign in"
        label.font = R.Font.montserrat(type: .bold, size: 26)
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = C.cornerRadiusTextFields
        textField.backgroundColor = R.Color.textField
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [NSAttributedString.Key.foregroundColor: R.Color.grayText,
                         NSAttributedString.Key.font: R.Font.montserrat(type: .medium, size: 12)]
        )
        return textField
    }()
    
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = C.cornerRadiusTextFields
        textField.backgroundColor = R.Color.textField
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "Last name",
            attributes: [NSAttributedString.Key.foregroundColor: R.Color.grayText,
                         NSAttributedString.Key.font: R.Font.montserrat(type: .medium, size: 12)]
        )
        return textField
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
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
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
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = R.Font.montserrat(type: .bold, size: 16)
        button.backgroundColor = R.Color.universalBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let isThereAccountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Already have an account?"
        label.font = R.Font.montserrat(type: .light, size: 12)
        label.tintColor = R.Color.grayText
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.tintColor = R.Color.universalBlue
        button.titleLabel?.font = R.Font.montserrat(type: .medium, size: 12)
        return button
    }()
    
    private let signInWithGoogleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign in with Google"
        label.font = R.Font.montserrat(type: .medium, size: 14)
        label.tintColor = R.Color.grayText
        return label
    }()
    
    private let signInWithAppleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign in with Apple"
        label.font = R.Font.montserrat(type: .medium, size: 14)
        label.tintColor = R.Color.grayText
        return label
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

private extension RegisterViewController {
    
    func setupVC() {
        view.backgroundColor = R.Color.background
    }
    
    func setupSubviews() {
        view.addSubview(registerTitleLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(isThereAccountTitleLabel)
        view.addSubview(loginButton)
        view.addSubview(signInWithGoogleLabel)
        view.addSubview(signInWithAppleLabel)
    }
    
    func addGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
    }
    
    func bindViews() {
        firstNameTextField.addTarget(self, action: #selector(didChangeFirsNameField), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(didChangeLastNameField), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        registerButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        viewModel.$isAuthenticationFormValid.sink { [weak self] validationState in
            self?.registerButton.isEnabled = validationState
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

private extension RegisterViewController {
    
    func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okayButton)
        present(alert, animated: true)
    }
    
    @objc func didTapToDismiss() {
        view.endEditing(true)
    }
    
    @objc func didTapLoginButton() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didChangeFirsNameField() {
        viewModel.firstName = firstNameTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc func didChangeLastNameField() {
        viewModel.lastName = lastNameTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc func didChangeEmailField() {
        viewModel.email = emailTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc func didChangePasswordField() {
        viewModel.password = passwordTextField.text
        viewModel.validateAuthenticationForm()
    }
    
    @objc func didTapSignIn() {
        viewModel.createUser()
    }
    
}

//MARK: - Constants

private extension RegisterViewController {
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

private extension RegisterViewController {
    
    func configureConstraints() {
        let registerTitleLabelConstraints = [
            registerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ]
        
        let firstNameTextFieldConstraints = [
            firstNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstNameTextField.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 75),
            firstNameTextField.heightAnchor.constraint(equalToConstant: C.registerTextFieldsHeight),
            firstNameTextField.widthAnchor.constraint(equalToConstant: C.registerTextFieldsWidth)
        ]
        
        let lastNameTextFieldConstraints = [
            lastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 35),
            lastNameTextField.heightAnchor.constraint(equalToConstant: C.registerTextFieldsHeight),
            lastNameTextField.widthAnchor.constraint(equalToConstant: C.registerTextFieldsWidth)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 35),
            emailTextField.heightAnchor.constraint(equalToConstant: C.registerTextFieldsHeight),
            emailTextField.widthAnchor.constraint(equalToConstant: C.registerTextFieldsWidth)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: C.registerTextFieldsHeight),
            passwordTextField.widthAnchor.constraint(equalToConstant: C.registerTextFieldsWidth)
        ]
        
        let registerButtonConstraints = [
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            registerButton.heightAnchor.constraint(equalToConstant: C.registerButtonHeight),
            registerButton.widthAnchor.constraint(equalToConstant: C.registerButtonWidth)
        ]
        
        let isThereAccountTitleLabelConstraints = [
            isThereAccountTitleLabel.leadingAnchor.constraint(equalTo: registerButton.leadingAnchor),
            isThereAccountTitleLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 15)
        ]

        let loginButtonConstraints = [
            loginButton.leadingAnchor.constraint(equalTo: isThereAccountTitleLabel.trailingAnchor, constant: 5),
            loginButton.centerYAnchor.constraint(equalTo: isThereAccountTitleLabel.centerYAnchor)
            
        ]

        let signInWithGoogleLabelConstraints = [
            signInWithGoogleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInWithGoogleLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 100)
        ]

        let signInWithAppleLabelConstraints = [
            signInWithAppleLabel.leadingAnchor.constraint(equalTo: signInWithGoogleLabel.leadingAnchor),
            signInWithAppleLabel.topAnchor.constraint(equalTo: signInWithGoogleLabel.bottomAnchor, constant: 40)
        ]
        
        NSLayoutConstraint.activate(registerTitleLabelConstraints)
        NSLayoutConstraint.activate(firstNameTextFieldConstraints)
        NSLayoutConstraint.activate(lastNameTextFieldConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
        NSLayoutConstraint.activate(isThereAccountTitleLabelConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
        NSLayoutConstraint.activate(signInWithGoogleLabelConstraints)
        NSLayoutConstraint.activate(signInWithAppleLabelConstraints)
    }
    
}
