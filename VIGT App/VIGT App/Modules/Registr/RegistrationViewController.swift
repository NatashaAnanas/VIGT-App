//
//  RegistrationViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 24.11.2024.
//

import UIKit
import Foundation

final class RegistrationViewController: UIViewController {
    
    enum RegistrationType: Int {
        case email
        case password
    }
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = Localization.email.value
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.tag = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = Localization.password.value
        textField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        textField.layer.cornerRadius = 8
        textField.tintColor = .darkGray
        textField.textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        textField.tag = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    //TODO: [VIGT-9] - Сделать кастомную кнопку с затемнением при диактивации
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localization.registration.value, for: .normal)
        button.backgroundColor = .none
        button.titleLabel?.textColor = .darkGray
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.fillInAllFields.value
        label.textColor = .blue
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let errorEmailLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.wrongEmail.value
        label.textColor = .red
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let errorPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.wrongPassword.value
        label.textColor = .red
        label.isHidden = true
        label.contentMode = .center
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.addSubviews(emailTextField,
                         passwordTextField,
                         registerButton,
                         errorEmailLabel,
                         errorPasswordLabel,
                         errorLabel)
        view.backgroundColor = .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
        
        addRecognizer()
        addTargets()
        setupConstraints()
    }
    
    private func addRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func addTargets() {
        registerButton.addTarget(self,
                                 action: #selector(registrationButtonAction),
                                 for: .touchUpInside)
    }
    
    private func writeUserData() {
        if UserDefaults.standard.object(forKey: emailTextField.text!) == nil {
            errorLabel.isHidden = true
            UserDefaults.standard.set(passwordTextField.text!, forKey: emailTextField.text!)
            dismiss(animated: true)
        } else {
            errorLabel.text = Localization.emailIsAlreadyInUse.value
            errorLabel.isHidden = false
        }
    }
    
    
    @objc private func registrationButtonAction() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        if isValidEmail(emailTextField) && isValidPassword(passwordTextField) {
            errorLabel.isHidden = true
            writeUserData()
        } else {
            errorLabel.text = Localization.fillInAllFields.value
            errorLabel.isHidden = false
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension RegistrationViewController {
    
    private func setupConstraints() {
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
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: .spacing16),
            registerButton.heightAnchor.constraint(equalToConstant: .spacing32)
        ])
        
        NSLayoutConstraint.activate([
            errorEmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorEmailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -.spacing8)
        ])
        
        NSLayoutConstraint.activate([
            errorPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorPasswordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -.spacing8)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: errorEmailLabel.topAnchor, constant: -.spacing8)
        ])
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    private func wrongEmail() {
        errorEmailLabel.text = Localization.wrongEmail.value
        errorEmailLabel.isHidden = false
    }
    
    private func rightEmail() {
        errorEmailLabel.isHidden = true
    }
    
    private func errorSmallPassword() {
        errorPasswordLabel.text = Localization.passwordIsSmall.value
        errorPasswordLabel.isHidden = false
    }
    
    private func rightPassword() {
        errorPasswordLabel.isHidden = true
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch RegistrationType(rawValue: textField.tag) {
        case .email:
            isValidEmail(textField) ? rightEmail() : wrongEmail()
        case .password:
            isValidPassword(textField) ? rightPassword() : errorSmallPassword()
        default: break
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch RegistrationType(rawValue: textField.tag) {
        case .email:
            let allowedCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@.").inverted
            return string.rangeOfCharacter(from: allowedCharacters) == nil
        case .password:
            let allowedCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@.!#$%^&*()-_=+").inverted
            return string.rangeOfCharacter(from: allowedCharacters) == nil
        default:
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch RegistrationType(rawValue: textField.tag) {
        case .email:
            passwordTextField.becomeFirstResponder()
        case .password:
            passwordTextField.resignFirstResponder()
        default: break
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch RegistrationType(rawValue: textField.tag) {
        case .email:
            if isValidEmail(textField) {
                rightEmail()
            }
        case .password:
            if isValidPassword(textField) {
                rightPassword()
            }
        default: break
        }
        
    }
    
}
