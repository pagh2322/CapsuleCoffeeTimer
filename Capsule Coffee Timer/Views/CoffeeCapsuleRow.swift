//
//  CoffeeCapsuleRow.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleRow: View {
    var coffeeCapsule: CoffeeCapsule
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            self.coffeeCapsule.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("\(self.coffeeCapsule.name)")
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            if self.viewModel.isFavorite(self.coffeeCapsule) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
