//
//  ContentView.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

struct ContentView: View {
    @State var isInited = false
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        CoffeeCapsuleList()
            .navigationViewStyle(.stack)
            .task {
                // Initialize favoritelist when first launched
                Task {
                    if !self.isInited {
                        self.viewModel.initFavoriteList()
                        self.isInited = true
                    }
                }
            }
    }
}
