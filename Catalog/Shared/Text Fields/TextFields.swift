//
//  TextFields.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/21/21.
//

import Foundation
import Props
import SwiftUI
import PreviewMultiple

extension PropGroup {
    static let textFields = PropGroup(name: "Text Fields",
                                      systemImage: "character.cursor.ibeam",
                                      subgroups: [.systemTextFields])
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple {
            PropGroupView(group: .textFields)
        }
    }
}
