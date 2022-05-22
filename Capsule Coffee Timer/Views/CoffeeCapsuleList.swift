//
//  CoffeeCapsuleList.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleList: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                // Favorite Coffee Capsules List
                if self.viewModel.searchText.isEmpty { // Show only when not searching
                    Section(header: Text("favorite".localized())) {
                        ForEach(self.viewModel.favoriteList) { coffee in
                            NavigationLink {
                                CoffeeCapsuleDetail(coffeeCapsule: coffee)
                            } label: {
                                CoffeeCapsuleRow(coffeeCapsule: coffee)
                            }
                        }
                    }
                }
                
                // All Coffee Capsules List
                // General
                Section(header: Text("general".localized())) {
                    ForEach(self.viewModel.filteredCoffeeCapsules[0]) { coffee in
                        NavigationLink {
                            CoffeeCapsuleDetail(coffeeCapsule: coffee)
                        } label: {
                            CoffeeCapsuleRow(coffeeCapsule: coffee)
                        }
                    }
                }
                
                // Starbucks
                Section(header: Text("sbucks".localized())) {
                    ForEach(self.viewModel.filteredCoffeeCapsules[1]) { coffee in
                        NavigationLink {
                            CoffeeCapsuleDetail(coffeeCapsule: coffee)
                        } label: {
                            CoffeeCapsuleRow(coffeeCapsule: coffee)
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
