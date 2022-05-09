//
//  CoffeeCapsuleDetail.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleDetail: View {
    var coffeeCapsule: CoffeeCapsule
    @ObservedObject var coffeeTimer = CoffeeTimer()
    @ObservedObject var milkTimer = MilkTimer()
    @State private var isFavorite = false
    @State var hasMilk = false
    @State var isMilkSelected = false
    @EnvironmentObject var viewModel: ViewModel
        
    var body: some View {
        VStack {
            Text(self.coffeeCapsule.name)
                .font(.title2)
                .bold()
                .padding(30.0)
            
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

            Spacer()

            HStack {
                if self.hasMilk {
                    VStack {
                        Spacer()
                        Text("Milk")
                            .font(.title2)
                            .padding(.vertical, 30.0)

                        if self.milkTimer.mode == .stopped {
                            Text("\(self.coffeeCapsule.milkLevel.toLevel)")
                                .font(.title)
                        } else {
                            Text(String(format: "%d", self.milkTimer.time))
                                .font(.title)}
                        Spacer()
                    }
                    .padding()
                    .foregroundColor(self.isMilkSelected ? .primary : .secondary)
                    .onTapGesture {
                        if !self.isMilkSelected {
                            self.isMilkSelected = true
                        }
                    }
                }

                VStack {
                    Spacer()
                    Text("Coffee")
                        .font(.title2)
                        .padding(.vertical, 30.0)

                    if self.coffeeTimer.mode == .stopped {
                        Text("\(self.coffeeCapsule.coffeeLevel.toLevel)")
                            .font(.title)
                    } else {
                        Text(String(format: "%d", self.coffeeTimer.time))
                            .font(.title)}
                        Spacer()
                }
                .padding()
                .foregroundColor(((self.coffeeCapsule.milkLevel != 0) && self.isMilkSelected) ? .secondary : .primary)
                .onTapGesture {
                    if self.isMilkSelected {
                        self.isMilkSelected = false
                    }
                }
            }

            Spacer()

            HStack {
                self.hasMilk ? Image(systemName: self.milkTimer.isSound ? "speaker.wave.2" : "iphone.radiowaves.left.and.right")
                    .padding(.trailing, 50.0)
                    .onTapGesture {
                        if self.milkTimer.mode == .stopped {
                            self.milkTimer.isSound.toggle()
                        }
                    } : Image(systemName: self.coffeeTimer.isSound ? "speaker.wave.2" : "iphone.radiowaves.left.and.right")
                    .padding(.trailing, 50.0)
                    .onTapGesture {
                        if self.coffeeTimer.mode == .stopped {
                            self.coffeeTimer.isSound.toggle()
                        }
                    }
                
                if !self.hasMilk { // 오로지 커피만 넣을때
                    if self.coffeeTimer.mode == .stopped {
                        Image(systemName: "play")
                            .onTapGesture {
                                self.coffeeTimer.start(time: self.coffeeCapsule.coffeeLevel.toLevel)
                            }
                    } else if self.coffeeTimer.mode == .running {
                        Image(systemName: "restart")
                            .onTapGesture {
                                self.coffeeTimer.stop()
                            }
                    }
                } else { // 타이머를 실행할 경우
                    if self.coffeeTimer.mode == .stopped && self.milkTimer.mode == .stopped {
                        Image(systemName: "play")
                            .onTapGesture {
                                if self.milkTimer.mode == .stopped && self.hasMilk { // 밀크타이머
                                    self.milkTimer.start(time: self.coffeeCapsule.coffeeLevel.toLevel)
                                } else if self.coffeeTimer.mode == .stopped && !self.hasMilk {
                                    self.coffeeTimer.start(time: self.coffeeCapsule.coffeeLevel.toLevel)
                                }
                            }
                    } else {
                        Image(systemName: "restart")
                            .onTapGesture {
                                if self.coffeeTimer.mode == .running {
                                    self.coffeeTimer.stop()
                                } else {
                                    self.milkTimer.stop()
                                }
                            }
                    }
                }
            }
            .font(.largeTitle)
            .padding(.bottom, 200.0)

            Spacer()
        }
        .onAppear {
            self.coffeeTimer.time = coffeeCapsule.coffeeLevel.toLevel
            if self.coffeeCapsule.milkLevel != 0 {
                self.hasMilk = true
                self.isMilkSelected = true
                self.milkTimer.time = coffeeCapsule.milkLevel.toLevel
            }
            self.isFavorite = self.viewModel.isFavorite(coffeeCapsule)
        }
    }
}
