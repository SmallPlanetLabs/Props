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

    func tintOrShade(color: Color, amount: CGFloat) -> Color {
        scheme == .dark ? color.tinted(amount: amount) : color.tinted(amount: amount)
    }
}

public struct OutlinedButton: ButtonStyle, Enableable, PrimaryColorable, ColorSchemable {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.colorScheme) var scheme: ColorScheme
    let cornerRadius: CGFloat

    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(backgroundColor(for: configuration))

        configuration
            .label
            .foregroundColor(backgroundColor(for: configuration))
            .padding()
            .background(background)
    }

    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}

public struct FilledButton: ButtonStyle, Enableable, PrimaryColorable, ColorSchemable  {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.colorScheme) var scheme: ColorScheme
    let cornerRadius: CGFloat

    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundColor(for: configuration))

        configuration.label
            .foregroundColor(secondaryColor)
            .padding()
            .background(background)
    }

    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}

public struct PaperShadowedButton: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.secondaryColor) var secondaryColor: Color
    
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
            .foregroundColor(secondaryColor.opacity(isEnabled ? 1 : 0.4))

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

public struct SoftDynamicButtonStyle<S: Shape> : ButtonStyle {
    
    // MARK: - Properties
    var shape: S
    var mainColor: Color
    var textColor: Color
    var darkShadowColor: Color
    var lightShadowColor: Color
    
    // MARK: - Initializer
    public init(_ shape: S, mainColor: Color, textColor: Color, darkShadowColor: Color, lightShadowColor: Color) {
        self.shape = shape
        self.mainColor = mainColor
        self.textColor = textColor
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
    }
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            configuration.label
                .foregroundColor(textColor)
                .padding()
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
                .background(
                    ZStack {
                        shape.fill(mainColor)
                            .softInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, spread: 0.15, radius: 3)
                            .opacity(configuration.isPressed ? 1 : 0)
                        
                        shape.fill(mainColor)
                            .softOuterShadow(darkShadow: darkShadowColor, lightShadow: lightShadowColor, offset: 6, radius: 3)
                            .opacity(configuration.isPressed ? 0 : 1)
                    }
                )
        }
        
    }
    
}

@available(*, deprecated, message: "Use SoftDynamicButtonStyle instead")
public struct SoftButtonStyle<S: Shape> : ButtonStyle {
    
    // MARK: - Properties
    var shape: S
    var mainColor: Color
    var textColor: Color
    var darkShadowColor: Color
    var lightShadowColor: Color
    
    // MARK: - Initializer
    public init(_ shape: S, mainColor : Color, textColor : Color, darkShadowColor: Color, lightShadowColor: Color) {
        self.shape = shape
        self.mainColor = mainColor
        self.textColor = textColor
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
    }
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            shape.fill(mainColor)
                .softInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, spread: 0.15, radius: 3)
                .opacity(configuration.isPressed ? 1 : 0)
            
            shape.fill(mainColor)
                .softOuterShadow(darkShadow: darkShadowColor, lightShadow: lightShadowColor, offset: 6, radius: 3)
                .opacity(configuration.isPressed ? 0 : 1)
            
            configuration.label
                .foregroundColor(textColor)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
        }
    }
    
}

extension Button {
    public func softButtonStyle<S : Shape>(_ content: S, mainColor: Color = Neumorphic.shared.mainColor(), textColor: Color = Neumorphic.shared.secondaryColor(), darkShadowColor: Color = Neumorphic.shared.darkShadowColor(), lightShadowColor: Color = Neumorphic.shared.lightShadowColor()) -> some View {
        self.buttonStyle(SoftDynamicButtonStyle(content, mainColor: mainColor, textColor: textColor, darkShadowColor: darkShadowColor, lightShadowColor: lightShadowColor))
    }
}
