//
//  Backport.swift
//
//  Created by Ryan Goodlett on 10/19/21.
//

import Props
import SwiftUI

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
