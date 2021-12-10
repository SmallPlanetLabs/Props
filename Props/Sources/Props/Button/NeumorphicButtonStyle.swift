//
//  File.swift
//  
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

public struct NeumorphicButtonStyle: ButtonStyle, Enableable, PrimaryColorable, ColorSchemable {
    
    // MARK: - Properties
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.shadowColor) var shadowColor: Color
    @Environment(\.colorScheme) var scheme: ColorScheme
    let cornerRadius: CGFloat
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(color(for: configuration))
                        .shadow(color: shadowColor, radius: 15, x: -5, y: -5)
                        .opacity(configuration.isPressed ? 0 : 0.5)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor(for: configuration))
                        .shadow(color: shadowColor, radius: 15, x: 5, y: 5)
                        .opacity(configuration.isPressed ? 0.8 : 0)
                }
            )
            .foregroundColor(secondaryColor)
    }
    
    // MARK: - Private API
    private var disabled: Color {
        scheme == .light ? primaryColor.shaded(amount: 0.3) : primaryColor.shaded(amount: 0.3)
    }
    
    private func color(for configuration: Configuration) -> Color {
        guard isEnabled else { return disabled.tinted(amount: 0.5) }
        return scheme == .light ? primaryColor.tinted(amount: 0.3) : primaryColor.shaded(amount: 0.3)
    }
    
    // MARK: - Initializer
    public init(cornerRadius: CGFloat = 10) {
        self.cornerRadius = cornerRadius
    }
    
}
