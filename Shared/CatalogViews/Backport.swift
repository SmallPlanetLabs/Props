//
//  Backport.swift
//
//  Created by Ryan Goodlett on 10/19/21.
//

import SwiftUI
import Combine

/// This struct is used to contain work-arounds for iOS version issues
/// that can be removed easily when that version of iOS is no longer needed
struct Backport<Content> {
    let content: Content
}

extension View {
    var backport: Backport<Self> { Backport(content: self) }
}

// MARK: - Material background

extension Backport where Content: View {
    @available(iOS, deprecated: 15.0, message: "Verify if workarounds are still needed")
    @ViewBuilder func materialBackground() -> some View {
        if #available(iOS 15, *) {
            content
                .background(Material.thickMaterial)
        } else {
            content
                .background(Color(white: 0.95))
        }
    }
}

