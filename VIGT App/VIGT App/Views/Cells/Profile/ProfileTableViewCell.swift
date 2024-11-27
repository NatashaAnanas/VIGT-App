//
//  ProfileTableViewCell.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 26.11.2024.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 16
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
//        self.tableView.rowHeight = UITableView.automaticDimension
        
//        mainTableView.estimatedRowHeight = 64
//        mainTableView.rowHeight = UITableView.automaticDimension
        
        print(mainTableView.estimatedRowHeight)
        
        addSubviews(mainTableView)
        setupConstraints()
    }
}

// MARK: - Constraints

extension ProfileTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: topAnchor, constant: .spacing8),
            mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacing8),
            mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacing16),
            mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacing16),
            mainTableView.heightAnchor.constraint(equalToConstant: 92)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
        cell.backgroundColor = .orange
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate

extension ProfileTableViewCell: UITableViewDelegate {
    
}
