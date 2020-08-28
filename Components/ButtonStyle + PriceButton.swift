//
//  PriceButtonStyleModifier.swift
//
//  Created by LW on 14/6/20.
//

import SwiftUI

// Inspired from: https://swiftui-lab.com/custom-styling/


struct PriceButtonStyle: ButtonStyle {
    private var transitionStatus: ButtonTransitionStatus = .default
    private var selected: Bool = false
    private var disabled: Bool = false

    init(selected: Bool, buttonStatus: ButtonTransitionStatus, disabled: Bool) {
        self.transitionStatus = buttonStatus
        self.selected = selected
        self.disabled = disabled
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(5)
            .foregroundColor(getLabelForgournd(configuration.isPressed))
            .background(getButtonBackground(configuration.isPressed))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: configuration.isPressed || selected ? 0 : 1)
            )
    }

    private func getLabelForgournd(_ pressed: Bool) -> Color {
        if pressed {
            return Color.white
        }
        if disabled {
            return Color.mainTextColor
        } else if selected {
            return Color.white
        }
        return Color.mainTextColor
    }

    private func getButtonBackground(_ pressed: Bool) -> Color {
        if pressed {
            return Color.redBright
        }
        
        if transitionStatus == .upTransient {
            return Color.green.opacity(0.2)
        } else if transitionStatus == .downTransient {
            return Color.redBright.opacity(0.2)
        }
        
        if disabled {
            return Color.white
        } else if selected {
            return Color.redBright
        }
        return Color.white
    }
}
