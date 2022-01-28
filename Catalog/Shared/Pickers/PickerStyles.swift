//
//  PickerStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/5/22.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemPickers = PropGroup(name: "System pickers", samples: [
        DefaultPickerSample(),
        InlinePickerSample(),
        MenuPickerSample(),
        SegmentedPickerSample(),
        WheelPickerSample(),
    ])
}

struct DefaultPickerSample: PropSampleable {
    let name = "Default picker style"
    let notes: String? = ".pickerStyle(.automatic)"
    let source = "System"
    let keywords = "picker system default automatic"
    @ViewBuilder var body: AnyView {
        AnyView(
            Picker("My Picker", selection: .constant("Soccer ⚽️")) {
                Text("Soccer ⚽️")
                    .tag(0)
                Text("Basketball 🏀")
                    .tag(1)
                Text("Baseball ⚾️")
                    .tag(2)
            }
            .pickerStyle(.automatic)
        )
    }
}

struct InlinePickerSample: PropSampleable {
    let name = "Inline picker style"
    let notes: String? = ".pickerStyle(.inline)"
    let source = "System"
    let keywords = "picker system inline"
    @ViewBuilder var body: AnyView {
        AnyView(
            Picker("My Picker", selection: .constant("Soccer ⚽️")) {
                Text("Soccer ⚽️")
                    .tag(0)
                Text("Basketball 🏀")
                    .tag(1)
                Text("Baseball ⚾️")
                    .tag(2)
            }
            .pickerStyle(.inline)
        )
    }
}

struct MenuPickerSample: PropSampleable {
    let name = "Menu picker style"
    let notes: String? = ".pickerStyle(.menu)"
    let source = "System"
    let keywords = "picker system menu"
    @ViewBuilder var body: AnyView {
        AnyView(
            Picker("My Picker", selection: .constant("Soccer ⚽️")) {
                Text("Soccer ⚽️")
                    .tag(0)
                Text("Basketball 🏀")
                    .tag(1)
                Text("Baseball ⚾️")
                    .tag(2)
            }
            .pickerStyle(.menu)
        )
    }
}

struct SegmentedPickerSample: PropSampleable {
    let name = "Segmented picker style"
    let notes: String? = ".pickerStyle(.segmented)"
    let source = "System"
    let keywords = "picker system segmented"
    @ViewBuilder var body: AnyView {
        AnyView(
            Picker("My Picker", selection: .constant("Soccer ⚽️")) {
                Text("Soccer ⚽️")
                    .tag(0)
                Text("Basketball 🏀")
                    .tag(1)
                Text("Baseball ⚾️")
                    .tag(2)
            }
            .pickerStyle(.segmented)
        )
    }
}

struct WheelPickerSample: PropSampleable {
    let name = "Wheel picker style"
    let notes: String? = ".pickerStyle(.wheel)"
    let source = "System"
    let keywords = "picker system wheel"
    @ViewBuilder var body: AnyView {
        AnyView(
            Picker("My Picker", selection: .constant("Soccer ⚽️")) {
                Text("Soccer ⚽️")
                    .tag(0)
                Text("Basketball 🏀")
                    .tag(1)
                Text("Baseball ⚾️")
                    .tag(2)
            }
            .pickerStyle(.wheel)
        )
    }
}

struct SystemPickerStyles: View {
    var body: some View {
        PropGroupView(group: .systemPickers)
    }
}

struct SystemPickerStyles_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            SystemPickerStyles()
        }
    }
}
