//
//  PropHelpers.swift
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

/// Duplicates the modified View once as a disabled copy of the original.
/// This can be used to preview two copies of a styled Button, one enabled, one disabled
public struct CloneDisabled: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
        content.disabled(true)
    }
}
