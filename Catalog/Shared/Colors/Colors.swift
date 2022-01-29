//
//  Colors.swift
//  Catalog
//
//  Created by Quinn McHenry on 12/9/21.
//

import SwiftUI
import DynamicColor
import Props
import PreviewMultiple

/// Future possibilities: gradients, shadows

extension PropGroup {
    static let colors = PropGroup(name: "Colors", systemImage: "paintpalette.fill", subgroups: [
        .tintingShading,
        .buttonTintingShading
    ])
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            PropGroupView(group: .colors)
        }
    }
}
