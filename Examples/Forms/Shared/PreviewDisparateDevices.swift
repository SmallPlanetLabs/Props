//
//  PreviewDisparateDevices.swift
//  Lottery.com
//
//  Created by Ryan Goodlett on 5/18/21.
//
import SwiftUI

/// Builds a Group of `Content` on `iPhone 12 Pro Max`,
/// `iPhone 12 mini`, `iPhone SE (2nd generation)`,
/// and `iPod touch (7th generation)`.
struct PreviewDisparateDevices<Content: View>: View {
    let enabled: Bool
    let content: Content

    init(enabled: Bool = true, @ViewBuilder content: () -> Content) {
        self.enabled = enabled
        self.content = content()
    }
    var body: some View {
        Group {
            if enabled {
                content
                    .previewDevice("iPhone 12 Pro Max")
                    .previewDisplayName("iPhone 12 Pro Max")
                content
                    .previewDevice("iPhone 12 mini")
                    .previewDisplayName("iPhone 12 mini")
                content
                    .previewDevice("iPhone 8")
                    .previewDisplayName("iPhone SE (2nd generation)")
            } else {
                content
            }
        }
    }
}

struct PreviewDisparateDevices_Previews: PreviewProvider {
    static var previews: some View {
        PreviewDisparateDevices {
            Text( "Hello, world!")
        }
    }
}
