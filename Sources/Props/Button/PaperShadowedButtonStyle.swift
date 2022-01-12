//
//  File.swift
//  
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

/// A `ButtonStyle` that creates a capsule shaped button with shadow creating a 3D effect
///
/// The button is tinted with `primaryColor` and uses `shadowColor`
/// You can also use ``PaperShadowedButtonStyle/paperShadowed``  to construct this style.
public struct PaperShadowedButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.shadowColor) var shadowColor: Color

    public func makeBody(configuration: Configuration) -> some View {
        let offset = offset(for: configuration)
        let background = Capsule()
            .fill(color(for: configuration))
            .shadow(color: shadowColor, radius: offset, x: offset, y: offset)
        
        configuration
            .label
            .padding()
            .background(background)
            .foregroundColor(primaryColor.opacity(isEnabled ? 1 : 0.4))
    }
    
    private func color(for configuration: Configuration) -> Color {
        Color(white: 0.95, opacity: 1)
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

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ButtonStyle where Self == PaperShadowedButtonStyle {

    /// A ButtonStyle that creates a rounded rectangular button filled with a diminshed version of the text color.
    ///
    /// The button is tinted with `primaryColor`
    public static var paperShadowed: PaperShadowedButtonStyle {
        PaperShadowedButtonStyle()
    }
}
