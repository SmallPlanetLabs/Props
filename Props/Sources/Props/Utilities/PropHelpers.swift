//
//  PropHelpers.swift
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI
import DynamicColor

extension Color {
    public func tinted(amount: CGFloat) -> Color {
        Color(DynamicColor(self).tinted(amount: amount).cgColor)
    }

    public func shaded(amount: CGFloat) -> Color {
        Color(DynamicColor(self).shaded(amount: amount).cgColor)
    }
    
    public init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha))
    }
    
    public init(rgb: Int, alpha: CGFloat) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
}

/// Duplicates the modified View once as a disabled copy of the original
/// This can be used to preview two copies of a styled Button, one enabled, one disabled
public struct CloneDisabled: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
        content.disabled(true)
    }
}
