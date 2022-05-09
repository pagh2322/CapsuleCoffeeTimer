//
//  StringExtensions.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/05/09.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}

extension Int {
    var toLevel: Int {
        switch self {
        case 1:
            return 9
        case 2:
            return 11
        case 3:
            return 16
        case 4:
            return 21
        case 5:
            return 25
        case 6:
            return 29
        case 7:
            return 39
        default:
            return 0
        }
    }
}
