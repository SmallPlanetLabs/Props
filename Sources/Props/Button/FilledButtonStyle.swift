//
//  File.swift
//  Props
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

/// A Button style that creates a rectangular button filled with a single color and optionally rounded corners
///
/// - Parameter cornerRadius: Size of corner radius
///
/// You can also use ``FilledButtonStyle/filled`` or ``FilledButtonStyle/filled(cornerRadius:)`` to construct this style.
public struct FilledButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let cornerRadius: CGFloat
    
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: cornerRadius)
            .fill(primaryColor.tintOrShade(for: colorScheme, isEnabled: isEnabled, isActive: configuration.isPressed))

        configuration.label
            .foregroundColor(secondaryColor.tintOrShade(for: colorScheme, isEnabled: isEnabled))
            .padding()
            .background(background)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
    
    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ButtonStyle where Self == FilledButtonStyle {

    /// A ``ButtonStyle`` displaying a rectangular button filled with `primaryColor`.
    /// The label is tinted with `secondaryColor`
    public static var filled: FilledButtonStyle {
        FilledButtonStyle()
    }

    /// A ``ButtonStyle`` displaying a rounded rectangular button filled with `primaryColor`.
    /// The label is tinted with `secondaryColor`
    /// - Parameter cornerRadius: Size of corner radius
    public static func filled(cornerRadius: CGFloat) -> FilledButtonStyle {
        FilledButtonStyle(cornerRadius: cornerRadius)
    }
}
