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
extension Color {
    /// Apply tinting to a SwiftUI Color
    /// Tinting makes colors lighter by a fractional amount
    /// - Parameter amount: fractional amount to tint the Color. 0.0 leaves the color intact, 1.0 makes the color white
    /// - Returns: `Color` tinted (lightened) by `amount`
    public func tinted(amount: CGFloat) -> Color {
        Color(DynamicColor(self).tinted(amount: amount).cgColor)
    }

    /// Apply shading to a SwiftUI Color
    /// Shading makes colors darker by a fractional amount
    /// - Parameter amount: fractional amount to shade the Color. 0.0 leaves the color intact, 1.0 makes the color black
    /// - Returns: `Color` shaded (darkened) by `amount`
    public func shaded(amount: CGFloat) -> Color {
        Color(DynamicColor(self).shaded(amount: amount).cgColor)
    }
}
