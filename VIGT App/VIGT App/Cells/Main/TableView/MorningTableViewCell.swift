//
//  MorningTableViewCell.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 07.12.2024.
//

import UIKit

final class MorningTableViewCell: UITableViewCell {
    
    static let identifier = "MorningTableViewCell"

    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let clockLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 56, weight: .light)
        label.textAlignment = .left
        return label
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
    
    func configure(greeting: String, clock: String) {
        greetingLabel.text = greeting
        clockLabel.text = clock
    }
    
    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .white.withAlphaComponent(0.2)
        addSubviewsWithConstraints(greetingLabel, clockLabel)
        setupConstraints()
    }
}

// MARK: - Constraints

private extension MorningTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: .spacing8),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacing16),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacing16),
            
            clockLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor),
            clockLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .spacing16),
            clockLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.spacing16),
            clockLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.spacing8)
        ])
    }
}
