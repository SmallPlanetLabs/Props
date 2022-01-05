//
//  FlatButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//
// see https://developer.apple.com/documentation/swiftui/buttonstyle

import Props
import SwiftUI

extension PropGroup {
    static let flatButtons = PropGroup(name: "Flat buttons", samples: [
        FilledButtonSample(),
        OutlinedButtonSample(),
    ])
}

struct FilledButtonSample: PropSampleable {
    let name = "Filled button style"
    let notes: String? = ".buttonStyle(.filled(cornerRadius: 16)) where cornerRadius defaults to 0"
    let source = "Props"
    let keywords = "button custom flat rectangle filled"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Filled Button")
                    }
                    .buttonStyle(.filled)

                    Button {} label: {
                        Label("Filled Button", systemImage: "heart.fill")
                    }
                    .buttonStyle(.filled(cornerRadius: 16))
                }
                .primaryColor(.blue)
                .secondaryColor(.background)
            }
        )
    }
}

struct OutlinedButtonSample: PropSampleable {
    let name = "Outlined button style"
    let notes: String? = ".buttonStyle(.outlined(cornerRadius: 12)) where cornerRadius defaults to 0"
    let source = "Props"
    let keywords = "button custom flat rectangle outlined"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Outlined")
                    }
                    .buttonStyle(.outlined(cornerRadius: 12))
                    Button {} label: {
                        Label("Outlined", systemImage: "eye.fill")
                    }
                    .buttonStyle(.outlined)
                }
                .primaryColor(.blue)
            }
        )
    }
}

struct FlatButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            PropGroupView(group: .flatButtons)
        }
    }
}
