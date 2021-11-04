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
}
