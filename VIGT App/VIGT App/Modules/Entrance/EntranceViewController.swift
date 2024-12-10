//
//  EntranceViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 21.11.2024.
//

import UIKit

final class EntranceViewController: UIViewController {
    
    enum RegistrationType: Int {
        case email
        case password
    }
    
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
        textField.tag = 0
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = Localization.password.value
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.tag = 1
        textField.textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return textField
    }()
    
    let entranceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Localization.entrance.value, for: .normal)
        button.backgroundColor = .lightText
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.darkText, for: .normal)
        return button
    }()
    
    let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localization.registration.value, for: .normal)
        button.backgroundColor = .none
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.wrongEmailOrPassword.value
        label.textColor = .red
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let errorEmailLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.enterEmail.value
        label.textColor = .red
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let errorPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.enterPassword.value
        label.textColor = .red
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.addSubviewsWithConstraints(
            backgroundImageView,
            emailTextField,
            passwordTextField,
            registrationButton,
            entranceButton,
            errorLabel,
            errorEmailLabel,
            errorPasswordLabel
        )
        
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
        let mainTabBarVC = MainTabBarController()
        let navigationController = UINavigationController(rootViewController: mainTabBarVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    private func readUserData() {
        if UserDefaults.standard.string(forKey: emailTextField.text!) == passwordTextField.text! {
            errorLabel.isHidden = true
            goToMainVC()
        } else {
            errorLabel.text = Localization.wrongEmailOrPassword.value
            errorLabel.isHidden = false
        }
    }
    
    private func isValidEmail(_ textField: UITextField) -> Bool {
        let email = textField.text ?? ""
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: UITextField) -> Bool {
        return password.text?.count ?? 0 > 7
    }
    
    @objc private func entranceButtonAction() {
        errorEmailLabel.isHidden = emailTextField.text?.count ?? 0 > 0
        errorPasswordLabel.isHidden = passwordTextField.text?.count ?? 0 > 0
        
        if (isValidEmail(emailTextField) && isValidPassword(passwordTextField)) {
            readUserData()
        } else {
            errorLabel.isHidden = !(emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0)
        }
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
            errorLabel.bottomAnchor.constraint(equalTo: errorEmailLabel.topAnchor, constant: -.spacing8),
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
        
        NSLayoutConstraint.activate([
            errorEmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorEmailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -.spacing8)
        ])
        
        NSLayoutConstraint.activate([
            errorPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorPasswordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -.spacing8)
        ])
    }
}

extension EntranceViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        errorLabel.isHidden = true
        switch RegistrationType(rawValue: textField.tag) {
        case .email:
            errorEmailLabel.isHidden = textField.text?.count ?? 0 > 0
        case .password:
            errorPasswordLabel.isHidden = textField.text?.count ?? 0 > 0
        default: break
        }
    }
}
