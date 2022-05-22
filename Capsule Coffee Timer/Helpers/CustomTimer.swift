//
//  CustomTimer.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/10.
//

import Foundation
import SwiftUI
import Combine
import AudioToolbox
import AVFoundation
import UIKit

class CustomTimer: ObservableObject {
    @Published var time = 0
    @Published var mode: TimerMode = .stopped
    @Published var isSound = false
    var timer = Timer()
    @Published var coffeeTime: Int = 0
    @Published var milkTime: Int = 0
    @Published var isCoffee = true
    
    enum TimerMode {
        case running
        case stopped
    }
    
    func start(isCoffee: Bool) {
        self.mode = .running
        self.time = isCoffee ? self.coffeeTime : self.milkTime
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.time > 0 { // doing
                self.time -= 1
            } else if self.time == 0 { // end
                self.stop(isCoffee: isCoffee)
                if self.isSound {
                    SoundEffect.instance.playSound()
                    self.playSound()
                } else {
                    self.vibrate(count: 3)
                    
                }
            }
        }
    }
    func playSound() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.3) {
            SoundEffect.instance.playSound()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.3) {
            SoundEffect.instance.playSound()
        }
    }
    func vibrate(count: Int) {
        if count == 0 {
            return
        }
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) { [weak self] in
            self?.vibrate(count: count - 1)
        }
    }

    
    func stop(isCoffee: Bool) {
        self.timer.invalidate()
        self.time = isCoffee ? self.coffeeTime : self.milkTime
        self.mode = .stopped
    }
}


