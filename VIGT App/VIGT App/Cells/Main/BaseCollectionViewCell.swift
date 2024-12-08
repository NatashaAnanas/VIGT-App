//
//  BaseCollectionViewCell.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 08.12.2024.
//

import UIKit

final class BaseCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BaseCollectionViewCell"
    
    private var mainView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        setupUI()
        setupConstraints()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    private func setupUI() {
        addSubviewsWithConstraints(mainView)
    }
}

// MARK: - Constraints

private extension BaseCollectionViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: .spacing8),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacing8),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacing8),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacing8),
            mainView.heightAnchor.constraint(equalToConstant: 160),
            mainView.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}
