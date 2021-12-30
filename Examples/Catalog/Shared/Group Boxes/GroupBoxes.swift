//
//  GroupBoxes.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/30/21.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let groupBoxes = PropGroup(name: "Group Boxes", subgroups: [
        .systemGroupBoxes,
        .handwrittenGroupBoxes,
    ])
}

struct GroupBoxes_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .systemGroupBoxes)
        }
    }
}

