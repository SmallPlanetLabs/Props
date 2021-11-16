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

extension ButtonStyle where Self: Enableable & PrimaryColorable {
    func backgroundColor(for configuration: Configuration) -> Color {
        switch (isEnabled, configuration.isPressed) {
        case (false, _):
            return primaryColor.tinted(amount: 0.5)
        case (true, false):
            return primaryColor
        case (true, true):
            return primaryColor.tinted(amount: 0.7)
        }
    }
}

public struct OutlinedButton: ButtonStyle, Enableable, PrimaryColorable {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 2, style: .continuous)
            .stroke(backgroundColor(for: configuration))

        configuration
            .label
            .foregroundColor(backgroundColor(for: configuration))
            .padding()
            .background(background)
    }
    public init() {}
}

public struct FilledButton: ButtonStyle, Enableable, PrimaryColorable {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 2, style: .continuous)
            .fill(backgroundColor(for: configuration))

        configuration
            .label
            .foregroundColor(.white)
            .padding()
            .background(background)
    }
    public init() {}
}

public struct PaperShadowedButton: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    public func makeBody(configuration: Configuration) -> some View {
        let radius = radius(for: configuration)
        let xy = offset(for: configuration)
        let background = Capsule()
            .fill(color(for: configuration))
            .shadow(color: Color(white: 0.6), radius: radius, x: xy, y: xy)

        configuration
            .label
            .padding()
            .background(background)
            .foregroundColor(primaryColor.opacity(isEnabled ? 1 : 0.4))

    }

    private func color(for configuration: Configuration) -> Color {
        if configuration.isPressed {
            return Color(white: 0.95, opacity: 1)
        } else {
            return Color(white: 0.95, opacity: 1)
        }
    }

    private func radius(for configuration: Configuration) -> CGFloat {
        if configuration.isPressed {
            return 6
        } else if isEnabled {
            return 12
        } else {
            return 2
        }
    }

    private func offset(for configuration: Configuration) -> CGFloat {
        if configuration.isPressed {
            return 6
        } else if isEnabled {
            return 12
        } else {
            return 2
        }
    }
    
    public init() {}
}
