//
//  DatePickerStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/5/22.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemDatePickers = PropGroup(name: "System date pickers", samples: [
        DefaultDatePickerSample(),
        WheelDatePickerSample(),
        GraphicalDatePickerSample(),
        CompactDatePickerSample()
    ])
}

struct DefaultDatePickerSample: PropSampleable {
    let name = "Default date picker style"
    let notes: String? = ".datePickerStyle(.automatic)"
    let source = "System"
    let keywords = "date picker system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            DatePicker("Choose a date 📆", selection: .constant(Date()))
                .datePickerStyle(.automatic)
        )
    }
}

struct WheelDatePickerSample: PropSampleable {
    let name = "Wheel date picker style"
    let notes: String? = ".datePickerStyle(.wheel)"
    let source = "System"
    let keywords = "date picker system wheel"
    @ViewBuilder var body: AnyView {
        AnyView(
            DatePicker("Choose a date 📆", selection: .constant(Date()))
                .datePickerStyle(.wheel)
        )
    }
}

struct GraphicalDatePickerSample: PropSampleable {
    let name = "Graphical date picker style"
    let notes: String? = ".datePickerStyle(.graphical)"
    let source = "System"
    let keywords = "date picker system graphical"
    @ViewBuilder var body: AnyView {
        AnyView(
            DatePicker("Choose a date 📆", selection: .constant(Date()))
                .datePickerStyle(.graphical)
        )
    }
}

struct CompactDatePickerSample: PropSampleable {
    let name = "Compact date picker style"
    let notes: String? = ".datePickerStyle(.compact)"
    let source = "System"
    let keywords = "date picker system compact"
    @ViewBuilder var body: AnyView {
        AnyView(
            DatePicker("Choose a date 📆", selection: .constant(Date()))
                .datePickerStyle(.compact)
        )
    }
}

struct SystemDatePickerStyles: View {
    var body: some View {
        PropGroupView(group: .systemDatePickers)
    }
}

struct SystemDatePickerStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            SystemDatePickerStyles()
        }
    }
}
