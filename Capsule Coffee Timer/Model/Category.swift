//
//  Category.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import Foundation

enum Category: Int {
    case Americano = 1
    case Lungo
    case Espresso
    case AbsoluteOrigin
    case CafeMenu
    case SpecialMenu
    case Starbucks
    case IceMenu
    
    func getName() -> String {
        switch self {
        case .Americano:
            return "아메리카노"
        case .Lungo:
            return "룽고"
        case .Espresso:
            return "에스프레소"
        case .AbsoluteOrigin:
            return "앱솔루트 오리진"
        case .CafeMenu:
            return "카페 메뉴"
        case .SpecialMenu:
            return "스페셜 메뉴"
        case .Starbucks:
            return "스타벅스"
        case .IceMenu:
            return "아이스 메뉴"
        }
    }
}
