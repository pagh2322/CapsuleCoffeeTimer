//
//  CapsuleItem.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/05/21.
//

import Foundation

enum CapsuleItem {
    case coffee
    case milk
    
    var title: String {
        switch self {
        case .coffee:
            return "Coffee"
        case .milk:
            return "Milk"
        default :
            return ""
        }
    }
}
