//
//  Labels.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/4/22.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let labels = PropGroup(name: "Labels", systemImage: "textformat", subgroups: [
        .systemLabels,
        .verticalLabels,
    ])
}

struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .labels)
        }
    }
}
