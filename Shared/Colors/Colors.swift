//
//  Colors.swift
//  Catalog
//
//  Created by Quinn McHenry on 12/9/21.
//

import SwiftUI
import DynamicColor
import Props

/// Future possibilities: gradients, shadows

extension PropGroup {
    static let colors = PropGroup(name: "Colors", subgroups: [
        .tintingShading,
    ])
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            PropGroupView(group: .colors)
        }
    }
}
