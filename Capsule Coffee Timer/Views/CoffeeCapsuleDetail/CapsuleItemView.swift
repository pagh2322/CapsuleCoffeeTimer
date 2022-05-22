//
//  CapsuleItemView.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/05/19.
//

import SwiftUI

struct CapsuleItemView: View {
    var capsuleKind: CapsuleItem
    @EnvironmentObject var customTimer: CustomTimer
    
    var body: some View {
        VStack {
            Text(self.capsuleKind.title)
                .font(.title2)
                .padding(.vertical, 30.0)
            
            Group {
                if self.customTimer.mode == .running {
                    if (self.customTimer.isCoffee && self.capsuleKind == .coffee) || (!self.customTimer.isCoffee && self.capsuleKind == .milk) {
                        Text(String(format: "%d", self.customTimer.time))
                    }
                    else {
                        Text(String(format: "%d", self.capsuleKind == .coffee ? self.customTimer.coffeeTime : self.customTimer.milkTime))
                    }
                } else {
                    Text(String(format: "%d", self.capsuleKind == .coffee ? self.customTimer.coffeeTime : self.customTimer.milkTime))
                }
            }
            .font(.title)
        }
    }
}
