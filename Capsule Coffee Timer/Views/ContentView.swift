//
//  ContentView.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coffee: Coffee
        
    var body: some View {
        CoffeeCapsuleList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Coffee())
    }
}
