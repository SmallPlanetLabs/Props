//
//  Lists.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/23/21.
//

import Foundation
import Props
import SwiftUI
import PreviewMultiple

extension PropGroup {
    static let lists = PropGroup(name: "Lists",
                                 systemImage: "list.number",
                                 subgroups: [.systemLists])
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple {
            PropGroupView(group: .lists)
        }
    }
}
