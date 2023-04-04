//
//  UserAccountViewController.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 11.03.2023.
//

import UIKit
import PhotosUI

class UserAccountViewController: UIViewController {
    
    // MARK: - Properties

    private let viewModel = UserAccountViewModel()

    //MARK: - Subviews

    private let avatarPlaceholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.backgroundColor = .lightGray
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.image = UIImage(named: "iconAvatar")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .gray
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let userName: UILabel = {
        let name = UILabel()
        name.text = ""
        return name
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVC()
        setupSubviews()
        addGesture()
        configureConstraints()
        
    }
    


}

//MARK: - Setups

private extension UserAccountViewController {
    
    func setupVC() {
        view.backgroundColor = R.Color.background
        navigationItem.title = "Profile"
    }
    
    func setupSubviews() {
        view.addSubview(avatarPlaceholderImageView)
        view.addSubview(userName)
    }
    
    func addGesture() {
        avatarPlaceholderImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToPhoto)))

    }
    
}

//MARK: - Action

private extension UserAccountViewController {
    
    @objc func didTapToPhoto() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
}

//MARK: - Configure constraints

private extension UserAccountViewController {
    
    func configureConstraints() {
        let avatarPlaceholderImageViewConstraints = [
            avatarPlaceholderImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarPlaceholderImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            avatarPlaceholderImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarPlaceholderImageView.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(avatarPlaceholderImageViewConstraints)
    }
    
}

//MARK: - PHPickerViewControllerDelegate

extension UserAccountViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self?.avatarPlaceholderImageView.image = image
                    }
                }
            }
        }
    }
    
    
}
