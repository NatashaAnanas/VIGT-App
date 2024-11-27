//
//  ProfileViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 26.11.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        
        view.addSubview(mainTableView)
        setupConstraints()
    }
}

// MARK: - Constraints

extension ProfileViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProfileTableViewCell",
            for: indexPath
        ) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        cell.configure()
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
}

// TODO: - вынести в отдельный файл
extension ProfileViewController {
    private func setupInitialStateNotificationCenter() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillShow),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillHide),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            mainTableView.contentInset.bottom = keyboardSize.height
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        mainTableView.contentInset.bottom = 0
    }
}
