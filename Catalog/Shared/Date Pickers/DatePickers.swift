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
    static let datePickers = PropGroup(name: "Date Pickers", subgroups: [
        .systemDatePickers,
    ])
}

struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .systemDatePickers)
        }
    }
}
