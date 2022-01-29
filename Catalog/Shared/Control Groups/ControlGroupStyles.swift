//
//  ControlGroupStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/5/22.
//

import Props
import SwiftUI
import PreviewMultiple

extension PropGroup {
    static let systemControlGroups = PropGroup(name: "System control groups", samples: [
        DefaultControlGroupSample(),
        NavigationControlGroupSample(),
    ])
}

struct DefaultControlGroupSample: PropSampleable {
    let name = "Default (automatic) control group style"
    let notes: String? = ".controlGroupStyle(.automatic)"
    let source = "System"
    let keywords = "control group system default automatic"
    @ViewBuilder var body: AnyView {
        AnyView(
            ControlGroup {
                Button {} label: { Text("Login") }
                Button {} label: { Text("Cancel") }
                Button {} label: { Text("Sign up") }
            }.controlGroupStyle(.automatic)
        )
    }
}

struct NavigationControlGroupSample: PropSampleable {
    let name = "Navigation control group style"
    let notes: String? = ".controlGroupStyle(.navigation)"
    let source = "System"
    let keywords = "label system icon only"
    @ViewBuilder var body: AnyView {
        AnyView(
            ControlGroup {
                Button {} label: { Text("Login") }
                Button {} label: { Text("Cancel") }
                Button {} label: { Text("Sign up") }
            }.controlGroupStyle(.navigation)
        )
    }
}

struct SystemControlGroupStyles: View {
    var body: some View {
        PropGroupView(group: .systemControlGroups)
    }
}

struct SystemControlGroupStyles_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            SystemControlGroupStyles()
        }
    }
}
