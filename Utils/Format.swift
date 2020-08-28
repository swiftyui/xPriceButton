//
//  Global.swift
//
//  Created by LW on 14/6/20.
//

import Foundation

struct Format {
    static func ODDS(odds: MOdds) -> String {
        return DECIMALODDS(odds: odds.decimal)
    }

    static func DECIMALODDS(odds: Float) -> String {
        odds < 100 || odds != floor(odds) ? String(format: "%.2f", odds) : "\(odds)"
    }
}
