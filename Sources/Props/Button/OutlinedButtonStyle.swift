//
//  OutlinedButtonStyle.swift
//  Props
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

/// A Button style that creates a rectangular button without a fill color and optionally rounded corners
///
/// - Parameter cornerRadius: Size of corner radius
///
/// You can also use ``OutlinedButtonStyle/outlined`` or ``OutlinedButtonStyle/outlined(cornerRadius:)`` to construct this style.
public struct OutlinedButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let cornerRadius: CGFloat
    
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(primaryColor.tintOrShade(for: colorScheme, isEnabled: isEnabled, isActive: configuration.isPressed))
        
        configuration
            .label
            .foregroundColor(primaryColor.tintOrShade(for: colorScheme, isEnabled: isEnabled, isActive: configuration.isPressed))
            .padding()
            .background(background)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
    
    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ButtonStyle where Self == OutlinedButtonStyle {

    /// A `ButtonStyle` displaying a rectangular button stroked with `primaryColor`.
    public static var outlined: OutlinedButtonStyle {
        OutlinedButtonStyle()
    }

    /// A `ButtonStyle` displaying a rounded rectangular button stroked with `primaryColor`.
    /// - Parameter cornerRadius: Size of corner radius
    public static func outlined(cornerRadius: CGFloat) -> OutlinedButtonStyle {
        OutlinedButtonStyle(cornerRadius: cornerRadius)
    }
}
