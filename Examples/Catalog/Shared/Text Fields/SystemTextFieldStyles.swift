//
//  SystemTextFieldStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/21/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemTextFields = PropGroup(name: "System text fields", samples: [
        DefaultTextFieldSample(),
        PlainTextFieldSample(),
        RoundedBorderTextFieldSample()
    ])
}

struct DefaultTextFieldSample: PropSampleable {
    let name = "Default text field style"
    let notes: String? = ".textFieldStyle(DefaultTextFieldStyle())"
    let source = "System"
    let keywords = "text field system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            TextField("", text: .constant("Some text"))
                .textFieldStyle(DefaultTextFieldStyle())
        )
    }
}

struct PlainTextFieldSample: PropSampleable {
    let name = "Plain text field style"
    let notes: String? = ".textFieldStyle(PlainTextFieldStyle())"
    let source = "System"
    let keywords = "text field system plain"
    @ViewBuilder var body: AnyView {
        AnyView(
            TextField("", text: .constant("Some text"))
                .textFieldStyle(PlainTextFieldStyle())
        )
    }
}

struct RoundedBorderTextFieldSample: PropSampleable {
    let name = "Rounded border text field style"
    let notes: String? = ".textFieldStyle(RoundedBorderTextFieldStyle())"
    let source = "System"
    let keywords = "text field system rounded border"
    @ViewBuilder var body: AnyView {
        AnyView(
            TextField("", text: .constant("Some text"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
        )
    }
}

struct SystemTextFieldStyles: View {
    var body: some View {
        PropGroupView(group: .systemTextFields)
    }
}

struct SystemTextFieldStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemTextFieldStyles()
    }
}
