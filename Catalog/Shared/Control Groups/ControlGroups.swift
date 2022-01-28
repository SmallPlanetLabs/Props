//
//  ControlGroups.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/5/22.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let controlGroups = PropGroup(name: "Control Groups", systemImage: "filemenu.and.cursorarrow", subgroups: [
        .systemControlGroups,
    ])
}

struct ControlGroups_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple {
            PropGroupView(group: .controlGroups)
        }
    }
}
