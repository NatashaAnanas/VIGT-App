//
//  EntranceViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 21.11.2024.
//

import UIKit

final class EntranceViewController: UIViewController {
    
    private lazy var backgroundImageView = {
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: IconNames.mainBackgroundImage2)
        return imageView
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = Localization.email.value
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = Localization.password.value
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let entranceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Localization.entrance.value, for: .normal)
        button.backgroundColor = .lightText
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.darkText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localization.registration.value, for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.wrongLoginOrPassword.value
        label.textColor = .red
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubviews(backgroundImageView,
                         emailTextField,
                         passwordTextField,
                         registrationButton,
                         entranceButton,
                         errorLabel)
        
        view.sendSubviewToBack(backgroundImageView)
        
        addTargets()
        setupConstraints()
    }
    
    private func addTargets() {
        registrationButton.addTarget(self,
                                     action: #selector(registrationButtonAction),
                                     for: .touchUpInside)
        entranceButton.addTarget(self,
                                     action: #selector(entranceButtonAction),
                                     for: .touchUpInside)
    }
    
    private func goToMainVC() {
        // TODO: - доделать переход
        let mainVC = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
        
    }
    
    private func readUserData() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text  ?? ""
        
        if (!email.isEmpty && !password.isEmpty) {
            if UserDefaults.standard.string(forKey: email) == password {
                errorLabel.isHidden = true
                goToMainVC()
            } else {
                errorLabel.text = Localization.wrongLoginOrPassword.value
                errorLabel.isHidden = false
            }
            
        } else {
            errorLabel.text = Localization.fillInAllFields.value
            errorLabel.isHidden = false
        }
    }
    
    @objc private func entranceButtonAction() {
        readUserData()
    }
    
    @objc private func registrationButtonAction() {
        let registrationVC = RegistrationViewController()
        registrationVC.modalPresentationStyle = .formSheet
        show(registrationVC, sender: nil)
        
    }
}

extension EntranceViewController {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -.spacing16),
            errorLabel.heightAnchor.constraint(equalToConstant: .spacing32)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -.spacing32),
            emailTextField.widthAnchor.constraint(equalToConstant: .spacing184),
            emailTextField.heightAnchor.constraint(equalToConstant: .spacing32)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: .spacing32),
            passwordTextField.widthAnchor.constraint(equalToConstant: .spacing184),
            passwordTextField.heightAnchor.constraint(equalToConstant: .spacing32)
        ])
        
        NSLayoutConstraint.activate([
            entranceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entranceButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: .spacing40),
            entranceButton.widthAnchor.constraint(equalToConstant: .spacing184),
            entranceButton.heightAnchor.constraint(equalToConstant: .spacing40)
        ])
        
        NSLayoutConstraint.activate([
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.topAnchor.constraint(equalTo: entranceButton.bottomAnchor, constant: .spacing8),
            registrationButton.heightAnchor.constraint(equalToConstant: .spacing32)
        ])
    }
}

