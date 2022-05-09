//
//  ViewModel.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/05/09.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var allCoffeeCapsules: [[CoffeeCapsule]] = CoffeeCapsule.all
    @Published var favoriteList: [CoffeeCapsule] = [] // 즐겨찾기한 캡슐 목록
    @Published var filteredCoffeeCapsules: [[CoffeeCapsule]] = CoffeeCapsule.all
    
    @Published var searchText = "" {
        willSet {
            if newValue.isEmpty {
                self.filteredCoffeeCapsules = self.allCoffeeCapsules
            } else {
                self.filteredCoffeeCapsules[0] = self.allCoffeeCapsules[0].filter { coffeeCapsule in
                    return coffeeCapsule.name.contains(newValue)
                }
                self.filteredCoffeeCapsules[1] = self.allCoffeeCapsules[1].filter { coffeeCapsule in
                    return coffeeCapsule.name.contains(newValue)
                }
            }
        }
    }
    
    func initFavoriteList() {
        if let data = UserDefaults.standard.value(forKey: "favorites") as? Data {
            if let tempFavoriteList = try? PropertyListDecoder().decode([CoffeeCapsule].self, from: data) {
                self.favoriteList = tempFavoriteList
                CoffeeCapsule.favoriteList = self.favoriteList
            }
        }
    }
    
    func addToFavorite(_ coffeeCapsule: CoffeeCapsule) {
        coffeeCapsule.addToFavorite()
        self.favoriteList = CoffeeCapsule.favoriteList
    }
    
    func delFavorite(_ coffeeCapsule: CoffeeCapsule) {
        coffeeCapsule.delFavorite()
        self.favoriteList = CoffeeCapsule.favoriteList
    }
    
    func isFavorite(_ coffeeCapsule: CoffeeCapsule) -> Bool {
        coffeeCapsule.isFavorite()
    }
}
