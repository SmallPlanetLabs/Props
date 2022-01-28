//
//  DatePickers.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/5/22.
//

import Foundation
import Props
import SwiftUI

extension PropGroup {
    static let datePickers = PropGroup(name: "Date Pickers", systemImage: "calendar", subgroups: [
        .systemDatePickers,
    ])
}

struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple {
            PropGroupView(group: .datePickers)
        }
    }
}
