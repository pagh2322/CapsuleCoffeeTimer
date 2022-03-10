//
//  CoffeeCapsuleRow.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleRow: View {
    var coffeeCapsule: CoffeeCapsule
    
    var body: some View {
        HStack {
            coffeeCapsule.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(6)
            
            Text("\(coffeeCapsule.name)")
            
            Spacer()
            
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct CoffeeCapsuleRow_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCapsuleRow(coffeeCapsule: sbucksCoffee[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
