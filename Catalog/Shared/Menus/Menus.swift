//
//  Menus.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/29/21.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let menus = PropGroup(name: "Menus", systemImage: "filemenu.and.selection", subgroups: [
        .systemMenus,
    ])
}

struct Menus_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .menus)
        }
    }
}
