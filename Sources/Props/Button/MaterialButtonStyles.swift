//
//  MaterialButtonStyles.swift
//  
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI
import DynamicColor

/// A `ButtonStyle` that creates a rounded rectangular button filled with a diminshed version of the text color
///
/// The button is tinted with `primaryColor`
/// You can also use ``MonochromaticMaterialButtonStyle/monochromaticMaterial``  to construct this style.
public struct MonochromaticMaterialButtonStyle: ButtonStyle {
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

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ButtonStyle where Self == MonochromaticMaterialButtonStyle {

    /// A ButtonStyle that creates a rounded rectangular button filled with a diminshed version of the text color.
    ///
    /// The button is tinted with `primaryColor`
    public static var monochromaticMaterial: MonochromaticMaterialButtonStyle {
        MonochromaticMaterialButtonStyle()
    }
}
