//
//  CoffeCapsule.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import Foundation
import SwiftUI

struct CoffeeCapsule: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var coffeeLevel: Int
    var milkLevel: Int
//    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

struct Coffee: Identifiable {
    var id: Category
    var name: String
    var coffeeCapsules: [CoffeeCapsule]
}
