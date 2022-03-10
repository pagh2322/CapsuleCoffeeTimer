//
//  CoffeeCapsuleDetail.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct CoffeeCapsuleDetail: View {
    var coffeeCapsule: CoffeeCapsule
    @ObservedObject var customTimer = CustomTimer()
        
    var body: some View {
        VStack {
            Text(coffeeCapsule.name)
                .font(.title)
                .padding([.top, .leading, .trailing], 30.0)

//            FavoriteButton(isSet: true)

            Spacer()

            HStack {
                if coffeeCapsule.milkLevel != 0 {
                    VStack {
                    Spacer()
                    Text("Milk")
                        .font(.title2)
                        .padding(.vertical, 30.0)

                    Text("\(getTime(level: coffeeCapsule.milkLevel))")
                        .font(.title)

                    Spacer()
                    }
                    .padding()
                }

                VStack {
                    Spacer()
                    Text("Coffee")
                        .font(.title2)
                        .padding(.vertical, 30.0)

                    if customTimer.mode == .stopped {
                        Text("\(getTime(level: coffeeCapsule.coffeeLevel))")
                            .font(.title)
                    } else {
                        Text(String(format: "%d", customTimer.time))
                            .font(.title)}

                        Spacer()
                }
                .onTapGesture {
                    print("oneTap")
                }
                .padding()
                .foregroundColor(coffeeCapsule.milkLevel != 0 ? .secondary : .black)

            }

            Spacer()

            HStack {
                Image(systemName: "pencil")
                    .padding(.trailing, 30.0)
                if customTimer.mode == .stopped {
                    Button("Start") {
                        customTimer.start(time: getTime(level: coffeeCapsule.coffeeLevel))
                    }
                }
                if customTimer.mode == .running {
                    Button("Stop") {
                        customTimer.stop()
                    }
                }
                Image(systemName: "pencil")
                    .padding(.leading, 30.0)
            }
            .padding(.bottom, 200.0)
            .font(.largeTitle)

            Spacer()
        }
        .onAppear(perform: {
            customTimer.time = getTime(level: coffeeCapsule.coffeeLevel)
        })
    }
}

struct CoffeeCapsuleDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        CoffeeCapsuleDetail(coffeeCapsule: sbucksCoffee[8])
    }
}
