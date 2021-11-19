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
    let notes: String? = ".buttonStyle(FilledButton(cornerRadius:)) where cornerRadius defaults to 0"
    let source = "Custom"
    let keywords = "button custom flat rectangle filled"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Filled Button")
                    }
                    .buttonStyle(FilledButton())
                    Button {} label: {
                        Label("Filled Button", systemImage: "heart.fill")
                    }
                    .buttonStyle(FilledButton(cornerRadius: 16))
                }
                .primaryColor(.blue)
                .secondaryColor(.white)
            }
        )
    }
}

struct OutlinedButtonSample: PropSampleable {
    let name = "Outlined button style"
    let notes: String? = ".buttonStyle(OutlinedButton(cornerRadius:)) where cornerRadius defaults to 0"
    let source = "Custom"
    let keywords = "button custom flat rectangle outlined"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Outlined")
                    }
                    .buttonStyle(OutlinedButton(cornerRadius: 12))
                    Button {} label: {
                        Label("Outlined", systemImage: "eye.fill")
                    }
                    .buttonStyle(OutlinedButton())
                }
            }
        )
    }
}

struct FlatButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDark) {
            PropGroupView(group: .flatButtons)
        }
        .primaryColor(.purple)
    }
}
