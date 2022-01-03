//
//  TextFields.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/21/21.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let textFields = PropGroup(name: "Text Fields", subgroups: [
        .systemTextFields,
    ])
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .textFields)
        }
    }
}
