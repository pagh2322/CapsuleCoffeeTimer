//
//  CustomTimer.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/10.
//

import Foundation
import SwiftUI
import Combine

class CoffeeTimer: ObservableObject {
    @Published var time = 0
    @Published var mode: TimerMode = .stopped
    var timer = Timer()
    
    func start(time: Int) {
        mode = .running
        self.time = time
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.time > 0 {
                self.time -= 1
            } else if self.time == 0 {
                self.stop()
            }
        }
    }
    func stop() {
        timer.invalidate()
        time = 0
        mode = .stopped
    }
}
class MilkTimer: ObservableObject {
    @Published var time = 0
    @Published var mode: TimerMode = .stopped
    var timer = Timer()
    
    func start(time: Int) {
        mode = .running
        self.time = time
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.time > 0 {
                self.time -= 1
            }
        }
    }
    func stop() {
        timer.invalidate()
        time = 0
        mode = .stopped
    }
}

enum TimerMode {
    case running
    case stopped
    case paused
}
