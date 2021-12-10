//
//  MaterialButtonStyles.swift
//  
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI
import DynamicColor

public struct MonochromaticMaterial: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color

    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(color(for: configuration))

        configuration
            .label
            .padding()
            .foregroundColor(isEnabled ? primaryColor : disabled)
            .background(background)
    }

    private var disabled: Color {
        primaryColor.shaded(amount: 0.5).tinted(amount: 0.5)
    }

    private func color(for configuration: Configuration) -> Color {
        guard isEnabled else { return disabled.tinted(amount: 0.7) }
        return primaryColor.tinted(amount: configuration.isPressed ? 0.8 : 0.6)
    }
    
    public init() {}
}
