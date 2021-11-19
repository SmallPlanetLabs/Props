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
    let combos: [PreviewCombo]
    let content: Content

    public init(combos: MultiplePreviewCombo = .defaults, @ViewBuilder content: () -> Content) {
        self.combos = combos
        self.content = content()
    }

    public var body: some View {
        ForEach(combos, id: \.name) { combo in
            content
                .previewDevice(SwiftUI.PreviewDevice(rawValue: combo.device.name))
                .previewDisplayName(combo.name)
                .colorScheme(combo.colorScheme)
                .backport.previewInterfaceOrientation(combo.orientation)
        }
    }
}
