//
//  BaseTableViewCell.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 08.12.2024.
//

import UIKit

final class BaseTableViewCell: UITableViewCell {
    
    static let identifier = "BaseTableViewCell"
    
    private var baseCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout.init())
    
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
    
    func configure(items: [String]) {
    }
    
    private func setupSettingsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        baseCollectionView = UICollectionView(
            frame: contentView.frame,
            collectionViewLayout: layout
        )
        
        baseCollectionView.register(
            BaseCollectionViewCell.self,
            forCellWithReuseIdentifier: BaseCollectionViewCell.identifier
        )
        
        baseCollectionView.backgroundColor = .clear
        baseCollectionView.showsHorizontalScrollIndicator = false
        
        baseCollectionView.delegate = self
        baseCollectionView.dataSource = self
        
        addSubviewsWithConstraints(baseCollectionView)
    }
    
    private func setupUI() {
        backgroundColor = .clear
        setupSettingsCollectionView()
        setupConstraints()
    }
}

// MARK: - Constraints

private extension BaseTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            baseCollectionView.topAnchor.constraint(equalTo: topAnchor),
            baseCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            baseCollectionView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}

extension BaseTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 170)
    }
}

extension BaseTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BaseCollectionViewCell.identifier,
            for: indexPath
        ) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
