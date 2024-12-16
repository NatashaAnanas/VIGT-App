//
//  RectangleTableViewCell.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 13.12.2024.
//

import UIKit

final class RectangleTableViewCell: UITableViewCell {
    
    static let identifier = "RectangleTableViewCell"
    
    private var mainView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubviewsWithConstraints(mainView)
        setupConstraints()
    }
}

// MARK: - Constraints

private extension RectangleTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: .spacing8),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacing8),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacing8),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacing8),
            mainView.heightAnchor.constraint(equalToConstant: 92)
        ])
    }
}
