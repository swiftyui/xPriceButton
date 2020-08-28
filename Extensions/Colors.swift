//
//  Colors.swift
//
//  Created by LW on 14/6/20.
//

import SwiftUI

extension Color {
    static func rgb(_ rgb: UInt) -> Color {
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0

        return Color(red: r, green: g, blue: b)
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xFF) / 255,
            G: Double((hex >> 08) & 0xFF) / 255,
            B: Double((hex >> 00) & 0xFF) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }

    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xFF0000) >> 16
        let g = (rgbValue & 0xFF00) >> 8
        let b = rgbValue & 0xFF

        self.init(red: Double(r) / 0xFF, green: Double(g) / 0xFF, blue: Double(b) / 0xFF)
    }
}

extension Color {
    static var mainTextColor: Color {
        Color.rgb(0x232323)
    }

    static var mainBackgroundColor: Color {
        Color.rgb(0xD5D5D5)
    }

    static var mainBorderColor: Color {
        Color.rgb(0xE8E8E8)
    }

    static var redBright: Color {
        Color.rgb(0xEB3638)
    }

    static var grayBase: Color {
        Color.rgb(0x232323)
    }

    static var grayBright: Color {
        Color.rgb(0xF7F7F7)
    }

    static var randomColor: Color {
        Color.rgb(UInt.random(in: 0 ... 0xFFFFFF))
    }
}
