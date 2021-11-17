//
//  Toggles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI
import Props

extension PropGroup {
    static let toggles = PropGroup(name: "Toggles", subgroups: [
        .systemToggles,
        .customToggles
    ])
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .toggles)
        }
    }
}

// MARK: - Helper for rendering multiple toggle states

struct ToggleExample<Content>: View where Content: View {
    let title: String?
    @State private var isOn = true
    @State private var isOnClone = false
    @ViewBuilder var content: Content

    var body: some View {
        VStack {
            if let title = title {
                HStack {
                    Text(title).font(.caption)
                    Spacer()
                }
            }
            Toggle(isOn: $isOn) {
                content
            }
            Toggle(isOn: $isOnClone) {
                content
            }
        }
    }
}

@available(iOS 15.0, *)
struct ToggleStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .customToggles)
        }
    }
}
