//
//  LevelToTime.swift
//  Capsule Coffee Timer
//
//  Created by peo on 2022/03/09.
//

import Foundation

func getTime(level: Int) -> Int {
    switch level {
    case 1:
        return 9
    case 2:
        return 11
    case 3:
        return 16
    case 4:
        return 21
    case 5:
        return 25
    case 6:
        return 29
    case 7:
        return 39
    default:
        return 0
    }
}
