//
//  SoundEffect.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/12.
//

import Foundation
import SwiftUI
import AVKit

class SoundEffect: ObservableObject {
    static let instance = SoundEffect()
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Ding-sound-effect", withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
}
