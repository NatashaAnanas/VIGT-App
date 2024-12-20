//
//  LocalizationKeys.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 22.11.2024.
//

import SwiftUI

enum Localization: String {
    // MARK: - Localization / General

    case password
    case email
    case registration
    case emailIsAlreadyInUse
    case fillInAllFields
    case wrongEmailOrPassword
    case entrance
    case wrongEmail
    case wrongPassword
    case passwordIsSmall
    case enterEmail
    case enterPassword
}

// MARK: - Localization value with params

extension Localization {
    private enum KeysWithParams: String {
        case privacy
    }

    static func privacy(termsURL: String, privacyURL: String) -> String {
        String(format: NSLocalizedString(KeysWithParams.privacy.rawValue, comment: ""), termsURL, privacyURL)
    }
}

// MARK: - Localization value

extension Localization {
    var value: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
