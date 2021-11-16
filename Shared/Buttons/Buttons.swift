//
//  Buttons.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import Props

extension PropGroup {
    static let buttons = PropGroup(name: "Buttons", subgroups: [
        .systemButtons,
        .materialButtons,
        .flatButtons,
        .customButtons
    ])
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .buttons)
                .padding()
        }
    }
}

// MARK: - Helpers

struct EnabledAndDisabled<Content>: View where Content: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 10) {
            content
                .modifier(CloneDisabled())
        }
    }
}
