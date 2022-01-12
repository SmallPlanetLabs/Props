//
//  Lists.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/23/21.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let lists = PropGroup(name: "Lists",
                                 systemImage: "list.number",
                                 subgroups: [.systemLists])
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .lists)
        }
    }
}
