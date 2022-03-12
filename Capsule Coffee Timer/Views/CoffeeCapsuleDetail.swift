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
    @State private var isMilk = false
    @EnvironmentObject var coffee: Coffee
        
    var body: some View {
        VStack {
            Text(coffeeCapsule.name)
                .font(.title)
                .padding(30.0)
            
            Button {
                if !isFavorite {
                    coffee.addFavorite(coffeeCapsule)
                } else {
                    coffee.delFavorite(coffeeCapsule)
                }
                isFavorite.toggle()
            } label: {
                Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isFavorite ? .yellow : .gray)
            }

            Spacer()

            HStack {
                if coffeeCapsule.milkLevel != 0 {
                    VStack {
                        Spacer()
                        Text("Milk")
                            .font(.title2)
                            .padding(.vertical, 30.0)

                        if milkTimer.mode == .stopped {
                            Text("\(getTime(level: coffeeCapsule.milkLevel))")
                                .font(.title)
                        } else {
                            Text(String(format: "%d", milkTimer.time))
                                .font(.title)}

                        Spacer()
                    }
                    .padding()
                    .foregroundColor(isMilk ? .primary : .secondary)
                    .onTapGesture {
                        isMilk.toggle()
                    }
                }

                VStack {
                    Spacer()
                    Text("Coffee")
                        .font(.title2)
                        .padding(.vertical, 30.0)

                    if coffeeTimer.mode == .stopped {
                        Text("\(getTime(level: coffeeCapsule.coffeeLevel))")
                            .font(.title)
                    } else {
                        Text(String(format: "%d", coffeeTimer.time))
                            .font(.title)}

                        Spacer()
                }
                .padding()
                .foregroundColor(((coffeeCapsule.milkLevel != 0) && isMilk) ? .secondary : .primary)
                .onTapGesture {
                    if coffeeCapsule.milkLevel != 0 {
                        isMilk.toggle()
                    }
                }

            }

            Spacer()

            HStack {
                isMilk ? Image(systemName: milkTimer.isSound ? "speaker.wave.2" : "iphone.radiowaves.left.and.right")
                    .padding(.trailing, 30.0)
                    .onTapGesture {
                        if milkTimer.mode == .stopped {
                            milkTimer.isSound.toggle()
                        }
                    } : Image(systemName: coffeeTimer.isSound ? "speaker.wave.2" : "iphone.radiowaves.left.and.right")
                    .padding(.trailing, 30.0)
                    .onTapGesture {
                        if coffeeTimer.mode == .stopped {
                            coffeeTimer.isSound.toggle()
                        }
                    }
                // 오로지 커피만 넣을때
                if coffeeCapsule.milkLevel == 0 {
                    if coffeeTimer.mode == .stopped{
                        Image(systemName: "play")
                            .onTapGesture {
                                coffeeTimer.start(time: getTime(level: coffeeCapsule.coffeeLevel))
                            }
                    } else if coffeeTimer.mode == .running{
                        Image(systemName: "restart")
                            .onTapGesture {
                                coffeeTimer.stop()
                            }
                    }
                } else{
                    // 타이머를 실행할 경우
                    if coffeeTimer.mode == .stopped && milkTimer.mode == .stopped {
                        Image(systemName: "play")
                            .onTapGesture {
                                if milkTimer.mode == .stopped && isMilk { // 밀크타이머
                                    milkTimer.start(time: getTime(level: coffeeCapsule.milkLevel))
                                } else if coffeeTimer.mode == .stopped && !isMilk {
                                    coffeeTimer.start(time: getTime(level: coffeeCapsule.coffeeLevel))
                                }
                            }
                    } else {
                        Image(systemName: "restart")
                            .onTapGesture {
                                if coffeeTimer.mode == .running {
                                    coffeeTimer.stop()
                                } else {
                                    milkTimer.stop()
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 200.0)
            .font(.largeTitle)

            Spacer()
        }
        .onAppear {
            coffeeTimer.time = getTime(level: coffeeCapsule.coffeeLevel)
            if coffeeCapsule.milkLevel != 0 {
                isMilk = true
                milkTimer.time = getTime(level: coffeeCapsule.milkLevel)
            }
            isFavorite = coffee.isFavorite(coffeeCapsule)
        }
    }
}

struct CoffeeCapsuleDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        CoffeeCapsuleDetail(coffeeCapsule: Coffee().all[0][0])
    }
}
