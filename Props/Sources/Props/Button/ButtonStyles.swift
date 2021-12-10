//
//  ButtonStyles.swift
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

protocol Enableable {
    var isEnabled: Bool { get }
}

protocol PrimaryColorable {
    var primaryColor: Color { get }
}

protocol ColorSchemable {
    var scheme: ColorScheme { get }
}

extension ButtonStyle where Self: Enableable & PrimaryColorable & ColorSchemable {
    func backgroundColor(for configuration: Configuration) -> Color {
        switch (isEnabled, configuration.isPressed) {
        case (false, _):
            return tintOrShade(color: primaryColor, amount: 0.5)
        case (true, false):
            return primaryColor
        case (true, true):
            return tintOrShade(color: primaryColor, amount: 0.7)
        }
    }
}

extension ButtonStyle where Self: ColorSchemable {
    func tintOrShade(color: Color, amount: CGFloat) -> Color {
        scheme == .dark ? color.tinted(amount: amount) : color.shaded(amount: amount)
    }
}
