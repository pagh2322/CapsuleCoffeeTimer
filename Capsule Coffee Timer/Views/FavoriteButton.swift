//
//  FavoriteButton.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            self.isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: self.isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(self.isSet ? .yellow : .gray)
        }
    }
}
