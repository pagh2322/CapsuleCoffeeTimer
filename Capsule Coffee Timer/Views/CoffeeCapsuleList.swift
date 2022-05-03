//
//  CoffeeCapsuleList.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleList: View {
    @EnvironmentObject var viewModel: ViewModel
    let category = ["general".localized(), "sbucks".localized()]
    
    var body: some View {
        NavigationView {
            List {
                // Favorite Coffee Capsules List
                if self.viewModel.searchText.isEmpty {
                    Section(header: Text("favorite".localized())) {
                        ForEach(self.viewModel.favoriteCoffeeCapsules ?? []) { coffee in
                            NavigationLink {
                                CoffeeCapsuleDetail(coffeeCapsule: coffee)
                            } label: {
                                CoffeeCapsuleRow(coffeeCapsule: coffee)
                            }
                        }
                    }
                }
                
                // All Coffee Capsules List
                ForEach(self.viewModel.filteredCoffeeCapsules.indices, id: \.self) { index in
                    Section(header: Text(category[index])) {
                        ForEach(self.viewModel.filteredCoffeeCapsules[index]) { coffee in
                            NavigationLink {
                                CoffeeCapsuleDetail(coffeeCapsule: coffee)
                            } label: {
                                CoffeeCapsuleRow(coffeeCapsule: coffee)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("title".localized())
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: self.$viewModel.searchText)
    }
}
