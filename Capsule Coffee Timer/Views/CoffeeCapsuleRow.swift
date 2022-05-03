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
            coffeeCapsule.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("\(coffeeCapsule.name)")
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            if self.viewModel.isFavorite(coffeeCapsule) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct CoffeeCapsuleRow_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCapsuleRow(coffeeCapsule: ViewModel().allCoffeeCapsules[0][0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
