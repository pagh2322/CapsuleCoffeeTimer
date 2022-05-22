//
//  CoffeeCapsuleDetail.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI
import GoogleMobileAds

struct CoffeeCapsuleDetail: View {
    var coffeeCapsule: CoffeeCapsule
    @StateObject var customTimer = CustomTimer()
    @State var hasMilk = false
    
    @EnvironmentObject var viewModel: ViewModel
    let adUnitId: String = "ca-app-pub-9999890187547613/7279764575" // Real Number
//    let adUnitId: String = "ca-app-pub-3940256099942544/2934735716"
        
    var body: some View {
        VStack {
            Text(self.coffeeCapsule.name)
                .font(.title2)
                .bold()
                .padding(30.0)
            
            FavoriteButton(coffeeCapsule: self.coffeeCapsule, isFavorite: self.viewModel.isFavorite(coffeeCapsule))

            Spacer()

            HStack {
                if self.hasMilk {
                    CapsuleItemView(capsuleKind: .milk)
                        .padding()
                        .foregroundColor(!self.customTimer.isCoffee ? .primary : .secondary)
                        .onTapGesture {
                            if self.customTimer.mode == .stopped && self.customTimer.isCoffee {
                                self.customTimer.isCoffee = false
                            }
                        }
                }
                
                CapsuleItemView(capsuleKind: .coffee)
                    .padding()
                    .foregroundColor((self.customTimer.isCoffee) ? .primary : .secondary)
                    .onTapGesture {
                        if self.customTimer.mode == .stopped && !self.customTimer.isCoffee {
                            self.customTimer.isCoffee = true
                        }
                    }
            }
            .environmentObject(self.customTimer)

            Spacer()

            HStack {
                Image(systemName: self.customTimer.isSound ? "speaker.wave.2" : "iphone.radiowaves.left.and.right")
                    .padding(.trailing, 50.0)
                    .onTapGesture {
                        if self.customTimer.mode == .stopped {
                            self.customTimer.isSound.toggle()
                        }
                    }
                
                Image(systemName: self.customTimer.mode == .stopped ? "play" : "restart")
                    .onTapGesture {
                        if self.customTimer.mode == .stopped {
                            self.customTimer.start(isCoffee: self.customTimer.isCoffee)
                        } else {
                            self.customTimer.stop(isCoffee: self.customTimer.isCoffee)
                        }
                    }
            }
            .font(.largeTitle)
            
            Spacer()
            
            //Ad
            BannerAd(adUnitId: adUnitId)
                .frame(width: UIScreen.main.bounds.width, height: 44, alignment: .center)
        }
        .onAppear {
            self.customTimer.coffeeTime = self.coffeeCapsule.coffeeLevel.toLevel
            if self.coffeeCapsule.milkLevel != 0 {
                self.hasMilk = true
                self.customTimer.isCoffee = false
                self.customTimer.milkTime = self.coffeeCapsule.milkLevel.toLevel
            }
        }
    }
}
