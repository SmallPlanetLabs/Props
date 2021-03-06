//
//  Buttons.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/2/21.
//

import Props
import SwiftUI
import PreviewMultiple

extension PropGroup {
    static let buttons = PropGroup(name: "Buttons", systemImage: "cursorarrow.rays", subgroups: [
        .systemButtons,
        .materialButtons,
        .flatButtons,
        .customButtons,
        .neumorphicButtons,
        .handwrittenButtons,
    ])
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple {
            PropGroupView(group: .buttons)
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
