//
//  SystemToggleStyles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

extension PropGroup {
    static let systemToggles = PropGroup(name: "System toggles", samples: [
        SwitchToggleSample(),
        ButtonToggleSample(),
    ])
}

struct SwitchToggleSample: PropSampleable {
    let name = "Switch toggle style"
    let notes: String? = ".toggleStyle(.switch)"
    let source = "System"
    let keywords = "toggle system default switch"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: ".switch") {
                Text("Toggler")
            }
            .toggleStyle(.switch)
        )
    }
}

struct ButtonToggleSample: PropSampleable {
    let name = "Button toggle style"
    let notes: String? = ".toggleStyle(.button)"
    let source = "System"
    let keywords = "toggle system default button"
    @ViewBuilder var body: AnyView {
        AnyView(Group {
            if #available(iOS 15.0, *) {
                ToggleExample(title: ".button") {
                    Text("Toggler")
                }
                .toggleStyle(.button)
            } else {
                Text("Available from iOS 15")
            }
        })
    }
}

struct SystemToggleStyles: View {
    var body: some View {
        VStack {
            ToggleExample(title: ".switch") {
                Text("Are you open to travel?")
            }
            .toggleStyle(.switch)

            if #available(iOS 15.0, *) {
                ToggleExample(title: ".button") {
                    Text("Are you open to travel?")
                }
                .toggleStyle(.button)
            } else {
                Text(".button style only available in iOS 15 and above")
            }
        }
    }
}

struct SystemToggleStyles_Previews: PreviewProvider {
    static var previews: some View {
        PropGroupView(group: .systemToggles)
    }
}
