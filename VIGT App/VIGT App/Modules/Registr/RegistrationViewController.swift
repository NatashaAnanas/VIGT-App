//
//  RegistrationViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 24.11.2024.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "e-mail"
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Пароль"
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .none
        button.titleLabel?.textColor = .darkGray
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubviews(emailTextField,
                         passwordTextField,
                         registerButton)
        
        view.backgroundColor = .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        
        addTargets()
        setupConstraints()
    }
    
    private func addTargets() {
        registerButton.addTarget(self,
                                 action: #selector(registrationButtonAction),
                                 for: .touchUpInside)
    }
    
    @objc private func registrationButtonAction() {
        dismiss(animated: true)
        
    }
}

extension RegistrationViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -32),
            emailTextField.widthAnchor.constraint(equalToConstant: 180),
            emailTextField.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32),
            passwordTextField.widthAnchor.constraint(equalToConstant: 180),
            passwordTextField.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            registerButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
