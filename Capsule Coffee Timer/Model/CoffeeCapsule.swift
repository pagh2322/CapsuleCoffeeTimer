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
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}

class Coffee: ObservableObject {
    @Published var all: [[CoffeeCapsule]]
    @Published var favorites: [CoffeeCapsule]?
    
    init() {
        all = [[CoffeeCapsule(id: 1, name: "더블 에스프레소", coffeeLevel: 3, milkLevel: 0, imageName: "doubleEspresso"),
                CoffeeCapsule(id: 2, name: "콜드 브루", coffeeLevel: 6, milkLevel: 0, imageName: "coldBrew"),
                CoffeeCapsule(id: 3, name: "네스퀵", coffeeLevel: 5, milkLevel: 0, imageName: "nesquik"),
                CoffeeCapsule(id: 4, name: "라테 마키아토", coffeeLevel: 2, milkLevel: 5, imageName: "latteMacchiato"),
                CoffeeCapsule(id: 5, name: "아메리카노", coffeeLevel: 7, milkLevel: 0, imageName: "americano"),
                CoffeeCapsule(id: 6, name: "아메리카노 마일드", coffeeLevel: 7, milkLevel: 0, imageName: "americanoMild"),
                CoffeeCapsule(id: 7, name: "콜롬비아 시에라 네바다 룽고", coffeeLevel: 4, milkLevel: 0, imageName: "colombiaSiera"),
                CoffeeCapsule(id: 8, name: "아메리카노 리치 아로마", coffeeLevel: 7, milkLevel: 0, imageName: "americanoRichAroma"),
                CoffeeCapsule(id: 9, name: "카푸치노", coffeeLevel: 1, milkLevel: 6, imageName: "cappuccino"),
                CoffeeCapsule(id: 10, name: "플랫 화이트", coffeeLevel: 6, milkLevel: 0, imageName: "flatwhite"),
                CoffeeCapsule(id: 11, name: "카페오레", coffeeLevel: 6, milkLevel: 0, imageName: "cafeAuLait"),
                CoffeeCapsule(id: 12, name: "아이스 아메리카노", coffeeLevel: 3, milkLevel: 0, imageName: "icedAmericano"),
                CoffeeCapsule(id: 13, name: "룽고", coffeeLevel: 4, milkLevel: 0, imageName: "lungo"),
                CoffeeCapsule(id: 14, name: "룽고 인텐소", coffeeLevel: 4, milkLevel: 0, imageName: "lungoIntenso"),
                CoffeeCapsule(id: 15, name: "룽고 디카페인", coffeeLevel: 4, milkLevel: 0, imageName: "lungoDecaffein"),
                CoffeeCapsule(id: 16, name: "에스프레소", coffeeLevel: 2, milkLevel: 0, imageName: "espresso"),
                CoffeeCapsule(id: 17, name: "에스프레소 인텐소", coffeeLevel: 2, milkLevel: 0, imageName: "espressoIntenso"),
                CoffeeCapsule(id: 18, name: "리스트레토 아덴자", coffeeLevel: 1, milkLevel: 0, imageName: "ristrettoArdenza"),
                CoffeeCapsule(id: 19, name: "캐러멜 라테 마키아토", coffeeLevel: 2, milkLevel: 5, imageName: "crmlLtMac"),
                CoffeeCapsule(id: 20, name: "초코치노", coffeeLevel: 4, milkLevel: 4, imageName: "chococino"),
                CoffeeCapsule(id: 21, name: "아메리카노 대용량팩 (VALUE)", coffeeLevel: 7, milkLevel: 0, imageName: "americanoValue"),
                CoffeeCapsule(id: 22, name: "룽고 대용량팩 (VALUE)", coffeeLevel: 4, milkLevel: 0, imageName: "lungo1"),
                CoffeeCapsule(id: 23, name: "에스프레소 대용량팩 (VALUE)", coffeeLevel: 2, milkLevel: 0, imageName: "espresso1"),
               ],
               [CoffeeCapsule(id: 24, name: "스타벅스® 파이크 플레이스 로스트 BY 네스카페 돌체구스토", coffeeLevel: 4, milkLevel: 0, imageName: "pikePlaceRoast"),
                CoffeeCapsule(id: 25, name: "스타벅스® 카페 라테 BY 네스카페 돌체구스토", coffeeLevel: 6, milkLevel: 0, imageName: "sbuxCaffeLatte"),
                CoffeeCapsule(id: 26, name: "스타벅스® 베란다 블렌드 BY 네스카페 돌체구스토", coffeeLevel: 7, milkLevel: 0, imageName: "starbucksVerandablend"),
                CoffeeCapsule(id: 27, name: "스타벅스® 하우스 블렌드 BY 네스카페 돌체구스토", coffeeLevel: 7, milkLevel: 0, imageName: "starbucksHouseblend"),
                CoffeeCapsule(id: 28, name: "스타벅스® 싱글 오리진 콜롬비아 BY 네스카페 돌체구스토", coffeeLevel: 1, milkLevel: 0, imageName: "colombiaEspresso"),
                CoffeeCapsule(id: 29, name: "스타벅스® 블론드 에스프레소 BY 네스카페 돌체구스토", coffeeLevel: 1, milkLevel: 0, imageName: "starbucksBlondeespresso"),
                CoffeeCapsule(id: 30, name: "스타벅스® 에스프레소 로스트 BY 네스카페 돌체구스토", coffeeLevel: 1, milkLevel: 0, imageName: "starbucksEspressoroast"),
                CoffeeCapsule(id: 31, name: "스타벅스® 카푸치노 BY 네스카페 돌체구스토", coffeeLevel: 2, milkLevel: 5, imageName: "starbucksCappuccino"),
                CoffeeCapsule(id: 32, name: "스타벅스® 라테 마키아토 BY 네스카페 돌체구스토", coffeeLevel: 1, milkLevel: 6, imageName: "starbucksLattemacchiato"),
                CoffeeCapsule(id: 33, name: "스타벅스® 캐러멜 마키아토 BY 네스카페 돌체구스토", coffeeLevel: 1, milkLevel: 5, imageName: "starbucksMacchiato"),
               ]]
        if let data = UserDefaults.standard.value(forKey: "favorites") as? Data {
            favorites = try? PropertyListDecoder().decode([CoffeeCapsule].self, from: data)
        }
    }
    func addFavorite(_ coffeeCapsule: CoffeeCapsule) {
        if favorites == nil {
            favorites = [coffeeCapsule]
            UserDefaults.standard.set(try? PropertyListEncoder().encode(favorites), forKey:"favorites")
        } else {
            for i in favorites! {
                if i.id == coffeeCapsule.id {
                    return
                } else {
                    favorites!.insert(coffeeCapsule, at: 0)
                    UserDefaults.standard.set(try? PropertyListEncoder().encode(favorites), forKey:"favorites")
                    return
                }
            }
        }
    }
    func delFavorite(_ coffeeCapsule: CoffeeCapsule) {
        var index = 0
        if (favorites == nil || favorites?.count == 0) {
            return
        } else {
            for i in favorites! {
                if i.id == coffeeCapsule.id {
                    favorites?.remove(at: index)
                    UserDefaults.standard.set(try? PropertyListEncoder().encode(favorites), forKey:"favorites")
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
