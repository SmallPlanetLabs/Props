//
//  ButtonStyles.swift
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

public struct OutlinedButton: ButtonStyle {
    @Environment(\.primaryColor) var primaryColor: Color
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 2, style: .continuous)
            .stroke(configuration.isPressed ? .gray : primaryColor)

        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : primaryColor)
            .padding()
            .background(background)
    }
    public init() {}
}

public struct FilledButton: ButtonStyle {
    @Environment(\.primaryColor) var primaryColor: Color
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 2, style: .continuous)
            .fill(configuration.isPressed ? .gray : primaryColor)

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
