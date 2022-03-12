//
//  CoffeCapsule.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import Foundation
import SwiftUI

struct CoffeeCapsule: Codable, Identifiable {
    var id: Int
    var name: String
    var coffeeLevel: Int
    var milkLevel: Int
    var isFavorite = false
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}

class Coffee: ObservableObject {
    @Published var all: [[CoffeeCapsule]]
    @Published var favorites: [CoffeeCapsule]?
    
    init() {
        all = [[CoffeeCapsule(id: 1, name: "더블 에스프레소", coffeeLevel: 3, milkLevel: 0, imageName: "doubleEspresso")],
               [CoffeeCapsule(id: 24, name: "스타벅스® 파이크 플레이스 로스트 BY 네스카페 돌체구스토", coffeeLevel: 4, milkLevel: 0, imageName: "pikePlaceRoast")]]
        if let data = UserDefaults.standard.value(forKey: "favorites") as? Data {
            favorites = try? PropertyListDecoder().decode([CoffeeCapsule].self, from: data)
        }
    }
    func addFavorite(_ coffeeCapsule: CoffeeCapsule) {
        if favorites == nil {
            favorites = [coffeeCapsule]
        } else {
            favorites!.forEach { coffee in
                if coffee.id == coffeeCapsule.id {
                    return
                } else { // 새로 추가할 경우
                    favorites!.insert(coffeeCapsule, at: 0)
                }
            }
        }
    }
    func delFavorite(_ coffeeCapsule: CoffeeCapsule) {
        var index = 0
        if (favorites == nil || favorites?.count == 0) {
            return
        } else {
            favorites?.forEach { coffee in
                if coffee.id == coffeeCapsule.id {
                    favorites?.remove(at: index)
                    return
                }
                index += 1
            }
        }
    }
    func isFavorite(_ coffeeCapsule: CoffeeCapsule) -> Bool {
        var isFav = false
        favorites?.forEach { coffee in
            if coffee.id == coffeeCapsule.id {
                isFav = true
            }
        }
        return isFav
    }
}
