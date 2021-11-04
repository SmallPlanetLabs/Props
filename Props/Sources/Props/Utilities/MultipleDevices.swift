//
//  MultipleDevices.swift
//  smallplanet.com
//
//  Created by Ryan Goodlett on 5/18/21.
//

import SwiftUI

// todo: OptionSet parameter for what devices to show with a .default option as below, potentially adding light/dark choices, too

/// Builds a Group of `Content` on `iPhone 13 Pro Max`,
/// `iPhone 8`, `iPhone 8`,
/// and `iPod touch (7th generation)`.
public struct MultipleDevices<Content: View>: View {
    let enabled: Bool
    let content: Content

    public init(enabled: Bool = true, @ViewBuilder content: () -> Content) {
        self.enabled = enabled
        self.content = content()
    }

    public var body: some View {
        Group {
            if enabled {
                content
                    .previewDevice("iPhone 13 Pro Max")
                    .previewDisplayName("iPhone 13 Pro Max")
                content
                    .previewDevice("iPhone 8")
                    .previewDisplayName("iPhone 8")
                content
                    .previewDevice("iPod touch (7th generation)")
                    .previewDisplayName("iPod touch (7th generation)")
            } else {
                content
            }
        }
    }
}
