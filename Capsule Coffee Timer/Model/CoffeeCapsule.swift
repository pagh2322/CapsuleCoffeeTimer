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

extension CoffeeCapsule {
    static var all: [[CoffeeCapsule]] { [[CoffeeCapsule(id: 1, name: "doubleEs".localized(), coffeeLevel: 3, milkLevel: 0, imageName: "doubleEspresso"),
                CoffeeCapsule(id: 2, name: "coldbrew".localized(), coffeeLevel: 6, milkLevel: 0, imageName: "coldBrew"),
                CoffeeCapsule(id: 3, name: "nesquik".localized(), coffeeLevel: 5, milkLevel: 0, imageName: "nesquik"),
                CoffeeCapsule(id: 4, name: "lattema".localized(), coffeeLevel: 2, milkLevel: 5, imageName: "latteMacchiato"),
                CoffeeCapsule(id: 5, name: "americano".localized(), coffeeLevel: 7, milkLevel: 0, imageName: "americano"),
                CoffeeCapsule(id: 6, name: "grande".localized(), coffeeLevel: 7, milkLevel: 0, imageName: "americanoMild"),
                CoffeeCapsule(id: 7, name: "colombiaLungo".localized(), coffeeLevel: 4, milkLevel: 0, imageName: "colombiaSiera"),
                CoffeeCapsule(id: 8, name: "americanoRich".localized(), coffeeLevel: 7, milkLevel: 0, imageName: "americanoRichAroma"),
                CoffeeCapsule(id: 9, name: "cappuccino".localized(), coffeeLevel: 1, milkLevel: 6, imageName: "cappuccino"),
                CoffeeCapsule(id: 10, name: "flatWhite".localized(), coffeeLevel: 6, milkLevel: 0, imageName: "flatwhite"),
                CoffeeCapsule(id: 11, name: "caffeAu".localized(), coffeeLevel: 6, milkLevel: 0, imageName: "cafeAuLait"),
                CoffeeCapsule(id: 12, name: "icedCoffee".localized(), coffeeLevel: 3, milkLevel: 0, imageName: "icedAmericano"),
                CoffeeCapsule(id: 13, name: "lungo".localized(), coffeeLevel: 4, milkLevel: 0, imageName: "lungo"),
                CoffeeCapsule(id: 14, name: "lungoIntenso".localized(), coffeeLevel: 4, milkLevel: 0, imageName: "lungoIntenso"),
                CoffeeCapsule(id: 15, name: "lungodecaffein".localized(), coffeeLevel: 4, milkLevel: 0, imageName: "lungoDecaffein"),
                CoffeeCapsule(id: 16, name: "espresso".localized(), coffeeLevel: 2, milkLevel: 0, imageName: "espresso"),
                CoffeeCapsule(id: 17, name: "espressoIntenso".localized(), coffeeLevel: 2, milkLevel: 0, imageName: "espressoIntenso"),
                CoffeeCapsule(id: 18, name: "ristretto".localized(), coffeeLevel: 1, milkLevel: 0, imageName: "ristrettoArdenza"),
                CoffeeCapsule(id: 19, name: "latteCaramel".localized(), coffeeLevel: 2, milkLevel: 5, imageName: "crmlLtMac"),
                CoffeeCapsule(id: 20, name: "chococino".localized(), coffeeLevel: 4, milkLevel: 4, imageName: "chococino"),
                CoffeeCapsule(id: 21, name: "americanoV".localized(), coffeeLevel: 7, milkLevel: 0, imageName: "americanoValue"),
                CoffeeCapsule(id: 22, name: "lungoV".localized(), coffeeLevel: 4, milkLevel: 0, imageName: "lungo1"),
                CoffeeCapsule(id: 23, name: "espressoV".localized(), coffeeLevel: 2, milkLevel: 0, imageName: "espresso1"),
               ],
               [CoffeeCapsule(id: 24, name: "sbucksPike".localized(), coffeeLevel: 4, milkLevel: 0, imageName: "pikePlaceRoast"),
                CoffeeCapsule(id: 25, name: "sbucksCaffe".localized(), coffeeLevel: 6, milkLevel: 0, imageName: "sbuxCaffeLatte"),
                CoffeeCapsule(id: 26, name: "sbucksVeranda".localized(), coffeeLevel: 7, milkLevel: 0, imageName: "starbucksVerandablend"),
                CoffeeCapsule(id: 27, name: "sbucksHouse".localized(), coffeeLevel: 7, milkLevel: 0, imageName: "starbucksHouseblend"),
                CoffeeCapsule(id: 28, name: "sbucksColombia".localized(), coffeeLevel: 1, milkLevel: 0, imageName: "colombiaEspresso"),
                CoffeeCapsule(id: 29, name: "sbucksBlonde".localized(), coffeeLevel: 1, milkLevel: 0, imageName: "starbucksBlondeespresso"),
                CoffeeCapsule(id: 30, name: "sbucksEspresso".localized(), coffeeLevel: 1, milkLevel: 0, imageName: "starbucksEspressoroast"),
                CoffeeCapsule(id: 31, name: "sbucksCappu".localized(), coffeeLevel: 2, milkLevel: 5, imageName: "starbucksCappuccino"),
                CoffeeCapsule(id: 32, name: "sbucksLatte".localized(), coffeeLevel: 1, milkLevel: 6, imageName: "starbucksLattemacchiato"),
                CoffeeCapsule(id: 33, name: "sbucksCaramel".localized(), coffeeLevel: 1, milkLevel: 5, imageName: "starbucksMacchiato"),
               ]]
    }
    
    static var favoriteList: [CoffeeCapsule] = [] {
        didSet {
            ViewModel().favoriteList = self.favoriteList
        }
    }
    
    func addToFavorite() {
        if CoffeeCapsule.favoriteList.count == 0 {
            CoffeeCapsule.favoriteList = [self]
        } else {
            for eachCoffeeCapsule in CoffeeCapsule.favoriteList {
                if eachCoffeeCapsule.id == self.id { // 이미 존재하는 경우
                    return
                } else { // 새로 추가
                    CoffeeCapsule.favoriteList.insert(self, at: 0)
                    break
                }
            }
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(CoffeeCapsule.favoriteList), forKey:"favorites")
    }
    
    func delFavorite() {
        var index = 0
        if CoffeeCapsule.favoriteList.count == 0 {
            return
        } else {
            for eachCoffeeCapsule in CoffeeCapsule.favoriteList {
                if eachCoffeeCapsule.id == self.id {
                    CoffeeCapsule.favoriteList.remove(at: index)
                    UserDefaults.standard.set(try? PropertyListEncoder().encode(CoffeeCapsule.favoriteList), forKey:"favorites")
                    return
                }
                index += 1
            }
        }
    }
    
    func isFavorite() -> Bool {
        for coffee in CoffeeCapsule.favoriteList {
            if coffee.id == self.id {
                return true
            }
        }
        return false
    }
}
