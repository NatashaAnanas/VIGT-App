//
//  UIView+extension.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 22.11.2024.
//

import UIKit

/// Расширение для добавления UIView элементов
public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
