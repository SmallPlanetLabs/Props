//
//  Pickers.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/5/22.
//

import Foundation
import Props
import SwiftUI
import PreviewMultiple

extension PropGroup {
    static let pickers = PropGroup(name: "Pickers", systemImage: "list.bullet", subgroups: [
        .systemPickers,
    ])
}

struct Pickers_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple {
            PropGroupView(group: .pickers)
        }
    }
}
