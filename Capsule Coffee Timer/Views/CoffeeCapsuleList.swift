//
//  CoffeeCapsuleList.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleList: View {
    @EnvironmentObject var coffee: Coffee
    
    var body: some View {
        let category = ["general".localized(), "sbucks".localized()]
        
        NavigationView {
            List {
                Section(header: Text("favorite".localized())) {
                    ForEach(coffee.favorites ?? []) { coffee in
                        NavigationLink {
                            CoffeeCapsuleDetail(coffeeCapsule: coffee)
                        } label: {
                            CoffeeCapsuleRow(coffeeCapsule: coffee)
                        }
                    }
                }
                ForEach(self.coffee.all.indices) { index in
                    Section(header: Text(category[index])) {
                        ForEach(coffee.all[index]) { coffee in
                            NavigationLink {
                                CoffeeCapsuleDetail(coffeeCapsule: coffee)
                            } label: {
                                CoffeeCapsuleRow(coffeeCapsule: coffee)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

struct CoffeeCapsuleList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCapsuleList()
            .environmentObject(Coffee())
    }
}
