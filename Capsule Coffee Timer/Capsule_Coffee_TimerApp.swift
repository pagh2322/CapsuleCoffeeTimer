//
//  Capsule_Coffee_TimerApp.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import SwiftUI

@main
struct Capsule_Coffee_TimerApp: App {
    @StateObject private var coffee = Coffee()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coffee)
        }
    }
}
