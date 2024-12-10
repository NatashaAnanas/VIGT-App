//
//  MainViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 24.11.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    private enum Sections: CaseIterable {
        case greetingCell
        case collectionCell
    }
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var backgroundImageView = {
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: IconNames.mainBackgroundImage)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubviewsWithConstraints(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        mainTableView.dataSource = self
        
        mainTableView.backgroundColor = .clear
        mainTableView.separatorStyle = .none
        
        mainTableView.register(
            MorningTableViewCell.self,
            forCellReuseIdentifier: MorningTableViewCell.identifier
        )
        mainTableView.register(
            BaseTableViewCell.self,
            forCellReuseIdentifier: BaseTableViewCell.identifier
        )
        view.addSubviewsWithConstraints(mainTableView)
    }
}

// MARK: - Constraints

extension MainViewController {
    
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

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections.allCases[section] {
        case .greetingCell: 1
        case .collectionCell: 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections.allCases[indexPath.section] {
        case .greetingCell:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MorningTableViewCell.identifier,
                for: indexPath
            ) as? MorningTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            // MARK: Вынести в константы/ сделать текущее время
            cell.configure(greeting: "Good Morning!", clock: "8:34")
            
            return cell
            
        case .collectionCell:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: BaseTableViewCell.identifier,
                for: indexPath
            ) as? BaseTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            return cell
        }
    }
}

// TODO: - вынести в отдельный файл
//extension MainViewController {
//    private func setupInitialStateNotificationCenter() {
//        NotificationCenter.default
//            .addObserver(self,
//                         selector: #selector(keyboardWillShow),
//                         name: UIResponder.keyboardWillShowNotification,
//                         object: nil)
//        NotificationCenter.default
//            .addObserver(self,
//                         selector: #selector(keyboardWillHide),
//                         name: UIResponder.keyboardWillHideNotification,
//                         object: nil)
//    }
//    
//    @objc private func keyboardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            mainTableView.contentInset.bottom = keyboardSize.height
//        }
//    }
//    
//    @objc private func keyboardWillHide(notification: Notification) {
//        mainTableView.contentInset.bottom = 0
//    }
//}
