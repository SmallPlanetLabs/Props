//
//  VerticalLabelStyle.swift
//  
//
//  Created by Djuro on 1/4/22.
//

import SwiftUI

/// A label style that shows the icon of a label above the  title using a
/// system-standard `Vstack` layout.
///
/// - Parameters:
///   - spacing: Points of spacing between icon and title
///
/// You can also use ``VerticalLabelStyle/vertical`` or ``VerticalLabelStyle/vertical(spacing:)`` to construct this style.
public struct VerticalLabelStyle: LabelStyle {
    
    // MARK: - Properties
    let spacing: CGFloat
    
    // MARK: - LabelStyle
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: spacing) {
            configuration.icon
            configuration.title
        }
    }
    
    // MARK: - Initializer
    public init(spacing: CGFloat = 8) {
        self.spacing = spacing
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LabelStyle where Self == VerticalLabelStyle {

    /// A `LabelStyle` that displays the icon of the label vertically stacked above the title.
    public static var vertical: VerticalLabelStyle {
        VerticalLabelStyle()
    }

    /// A `LabelStyle` that displays the icon of the label vertically stacked above the title.
    /// - Parameters:
    ///   - spacing: Points of spacing between icon and title
    public static func vertical(spacing: CGFloat) -> VerticalLabelStyle {
        VerticalLabelStyle(spacing: spacing)
    }
}
