//
//  FavoriteButton.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct FavoriteButton: View {
    var coffeeCapsule: CoffeeCapsule
    @State var isFavorite: Bool
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            if !self.isFavorite {
                self.viewModel.addToFavorite(self.coffeeCapsule)
            } else {
                self.viewModel.delFavorite(self.coffeeCapsule)
            }
            self.isFavorite.toggle()
        } label: {
            Image(systemName: self.isFavorite ? "star.fill" : "star")
                .font(.title3)
                .foregroundColor(self.isFavorite ? .yellow : .gray)
        }
    }
}
