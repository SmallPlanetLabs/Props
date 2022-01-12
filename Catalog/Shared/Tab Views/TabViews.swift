//
//  TabViews.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/23/21.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let tabViews = PropGroup(name: "Tab Views",
                                    systemImage: "rectangle.and.pencil.and.ellipsis",
                                    subgroups: [
                                        .systemTabViews,
                                    ])
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .tabViews)
        }
    }
}
