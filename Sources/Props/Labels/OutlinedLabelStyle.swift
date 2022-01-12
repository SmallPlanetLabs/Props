//
//  OutlinedLabelStyle.swift
//  Props
//
//  Created by Quinn McHenry on 1/6/22.
//

import SwiftUI

/// A `LabelStyle` surrounded by a rectangular stroked outline in `primaryColor` with optionally rounded corners
///
/// - Parameter cornerRadius: Size of corner radius
///
/// You can also use ``OutlinedLabelStyle/outlined`` or ``OutlinedLabelStyle/outlined(cornerRadius:)`` to construct this style.
public struct OutlinedLabelStyle: LabelStyle {
    @Environment(\.primaryColor) var primaryColor: Color
    let cornerRadius: CGFloat

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: cornerRadius).stroke(primaryColor))
    }

    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LabelStyle where Self == OutlinedLabelStyle {

    /// A `ButtonStyle` displaying a rectangular button stroked with `primaryColor`.
    public static var outlined: OutlinedLabelStyle {
        OutlinedLabelStyle()
    }

    /// A `GroupBoxStyle` surrounded by a rectangular stroked outline in `primaryColor` with rounded corners .
    /// - Parameter cornerRadius: Size of corner radius
    public static func outlined(cornerRadius: CGFloat) -> OutlinedLabelStyle {
        OutlinedLabelStyle(cornerRadius: cornerRadius)
    }
}
