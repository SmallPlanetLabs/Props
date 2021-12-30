//
//  GroupBoxStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/30/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemGroupBoxes = PropGroup(name: "System group boxes", samples: [
        DefaultGroupBoxSample(),
    ])
}

struct DefaultGroupBoxSample: PropSampleable {
    let name = "Default group box style"
    let notes: String? = ".groupBoxStyle(DefaultGroupBoxStyle())"
    let source = "System"
    let keywords = "group box system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            GroupBox(label: Label("Title Label", systemImage: "person")) {
                Text("GroupBox Content")
                Text("Even more content")
            }
                .groupBoxStyle(DefaultGroupBoxStyle())
        )
    }
}

struct SystemGroupBoxStyles: View {
    var body: some View {
        PropGroupView(group: .systemGroupBoxes)
    }
}

struct SystemGroupBoxStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemGroupBoxStyles()
    }
}
