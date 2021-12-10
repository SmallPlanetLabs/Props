//
//  Backport.swift
//  Props
//
//  Created by Quinn McHenry on 11/18/21.
//
// from https://davedelong.com/blog/2021/10/09/simplifying-backwards-compatibility-in-swift/

import SwiftUI

/// This struct is used to contain work-arounds for iOS version issues
/// that can be removed easily when that version of iOS is no longer needed
public struct Backport<Content> {
    public let content: Content
}

extension View {
    public var backport: Backport<Self> {
        Backport(content: self)
    }
}

// MARK: - Preview device orientation

@available(iOS, deprecated: 15.0, message: "Verify if workarounds are still needed")
public enum InterfaceOrientation {
    case portrait
    case portraitUpsideDown
    case landscapeLeft
    case landscapeRight

    @available(iOS 15.0, *)
    var orientation: SwiftUI.InterfaceOrientation {
        switch self {
        case .portrait:
            return .portrait
        case .portraitUpsideDown:
            return .portraitUpsideDown
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        }
    }
}

extension Backport where Content: View {
    @available(iOS, deprecated: 15.0, message: "Verify if workarounds are still needed")
    @ViewBuilder func previewInterfaceOrientation(_ orientation: InterfaceOrientation) -> some View {
        if #available(iOS 15, *) {
            content
                .previewInterfaceOrientation(orientation.orientation)
        } else {
            content
        }
    }
}
