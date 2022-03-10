//
//  CoffeeCapsuleList.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleList: View {
    
    let fav = [CoffeeCapsule]()
    
//    var favCoffeeCapsules: [CoffeeCapsule] {
//        modelData.coffeeCapsules.filter { coffeeCapsule in
//            coffeeCapsule.isFavorite
//        }
//    }
    
    var body: some View {
        let category = ["즐겨찾기", "일반", "스타벅스"]
        let allCoffee = [fav, generalCoffee, sbucksCoffee]
        
        NavigationView {
            List {
                ForEach(allCoffee.indices) { index in
                    Section(header: Text(category[index])) {
                        ForEach(allCoffee[index]) { coffee in
                            NavigationLink {
                                CoffeeCapsuleDetail(coffeeCapsule: coffee)
                            } label: {
                                CoffeeCapsuleRow(coffeeCapsule: coffee)
                            }
                        }
                    }
                }
//                ForEach(filteredCoffeeCapsules) { coffeeCapsule in
//                    NavigationLink {
//                        CoffeeCapsuleDetail(coffeeCapsule: coffeeCapsule)
//                    } label: {
//                        CoffeeCapsuleRow(coffeeCapsule: coffeeCapsule)
//                    }
//                }
            }
        }
    }
}

struct CoffeeCapsuleList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCapsuleList()
    }
}
