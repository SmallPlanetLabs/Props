//
//  SystemMenuStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/29/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemMenus = PropGroup(name: "System menus", samples: [
        DefaultMenuSample(),
        BorderlessMenuSample(),
    ])
}

struct DefaultMenuSample: PropSampleable {
    let name = "Default menu style"
    let notes: String? = ".menuStyle(DefaultMenuStyle())"
    let source = "System"
    let keywords = "menu system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            Menu("Menu") {
                Button("Item #1", action: { })
                Button("Item #2", action: { })
            }
            .menuStyle(DefaultMenuStyle())
        )
    }
}

struct BorderlessMenuSample: PropSampleable {
    let name = "Borderless button menu style"
    let notes: String? = ".menuStyle(BorderlessButtonMenuStyle())"
    let source = "System"
    let keywords = "menu system borderless menu"
    @ViewBuilder var body: AnyView {
        AnyView(
            Menu("Menu") {
                Button("Item #1", action: { })
                Button("Item #2", action: { })
            }
            .menuStyle(BorderlessButtonMenuStyle())
        )
    }
}

struct SystemMenuStyles: View {
    var body: some View {
        PropGroupView(group: .systemMenus)
    }
}

struct SystemMenuStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemMenuStyles()
    }
}
