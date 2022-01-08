//
//  DynamicColor+Extensions.swift
//  Props
//
//  Created by Quinn McHenry on 1/4/22.
//

import SwiftUI
import DynamicColor

/// Extends SwiftUI Colors with  DynamicColor's shading and tinting capabilities
/// See `Color Shading and Tinting` example in Catalog project for visual explanation.
public extension Color {

    /// Apply tinting to a SwiftUI Color
    /// Tinting makes colors lighter by a fractional amount
    /// - Parameter amount: fractional amount to tint the Color. 0.0 leaves the color intact, 1.0 makes the color white
    /// - Returns: `Color` tinted (lightened) by `amount`
    func tinted(amount: CGFloat) -> Color {
        Color(DynamicColor(self).tinted(amount: amount).cgColor)
    }

    /// Apply shading to a SwiftUI Color
    /// Shading makes colors darker by a fractional amount
    /// - Parameter amount: fractional amount to shade the Color. 0.0 leaves the color intact, 1.0 makes the color black
    /// - Returns: `Color` shaded (darkened) by `amount`
    func shaded(amount: CGFloat) -> Color {
        Color(DynamicColor(self).shaded(amount: amount).cgColor)
    }

    /// Determines if the color object is a light (bright) color.
    /// - returns: A boolean value true the color is light, false otherwise.
    func isLight() -> Bool {
        DynamicColor(self).isLight()
    }

    /// Apply shading or tinting conditionally to make a color appear diminished.
    /// A color considered light will become darker (shaded)), otherwise it will become lighter (tinted). This can be used to make a color represent a disabled state dependent on the active color scheme.
    func diminished(amount: CGFloat) -> Color {
        isLight() ? shaded(amount: amount) : tinted(amount: amount)
    }

    /// Apply tinting or shading conditionally to make a color appear stronger.
    /// A color considered light will become lighter (tinted), otherwise it will become darker (shaded). This can be used to make a color represent a disabled state dependent on the active color scheme.
    func enhanced(amount: CGFloat) -> Color {
        isLight() ? tinted(amount: amount) : shaded(amount: amount)
    }

    /// Apply conditional tinting or shading dependent on a number of states.
    /// - Parameters:
    ///    - colorScheme: `.light` or `.dark` color scheme
    ///    - isEnabled: represents the enabled/disabled state of the desired color, true if enabled
    ///    - isActive: represents the active (i.e., pressed) state of the desired color, true if active. Defaults to false.
    ///    - amount: floating point fractional amount to tint/shade the color in the range 0...1. Default 0.25
    /// - Returns: `Color` diminished if disabled, enhanced if pressed, and unchanged otherwise. See ``DynamicColor/diminshed`` and ``DynamicColor/enhanced`` for details.
    func tintOrShade(for colorScheme: ColorScheme, isEnabled: Bool, isActive: Bool = false, amount: CGFloat = 0.25) -> Color {
        switch (colorScheme, isEnabled, isActive) {
        case (.light, false, _):
            return diminished(amount: amount)
        case (.light, true, true):
            return enhanced(amount: amount)
        case (.light, true, false):
            return self
        case (.dark, false, _):
            return diminished(amount: amount)
        case (.dark, true, true):
            return enhanced(amount: amount)
        case (.dark, true, false):
            return self
        default:
            return self
        }
    }
}
