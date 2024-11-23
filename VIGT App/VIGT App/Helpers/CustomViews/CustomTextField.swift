//
//  CustomView.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 23.11.2024.
//

import UIKit

final class CustomTextField: UITextField {

    // Определяем отступы
    var textPadding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    var placeholderColor: UIColor = .gray {
        didSet {
            if let placeholder = self.placeholder {
                let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: placeholderColor]
                self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
            }
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        // Устанавливаем отступ для текста
        return bounds.inset(by: textPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        // Устанавливаем отступ для placeholder
        return bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // Устанавливаем отступ при редактировании (текстовое поле активно)
        return bounds.inset(by: textPadding)
    }
}
