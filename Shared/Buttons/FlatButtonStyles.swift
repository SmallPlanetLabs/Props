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
    let notes: String? = ".buttonStyle(FilledButton())"
    let source = "Custom"
    let keywords = "button custom flat rectangle filled"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Filled Button")
                    }
                    Button {} label: {
                        Label("Filled Button", systemImage: "heart.fill")
                    }
                }
                .buttonStyle(FilledButton())
            }
        )
    }
}

struct OutlinedButtonSample: PropSampleable {
    let name = "Outlined button style"
    let notes: String? = ".buttonStyle(OutlinedButton())"
    let source = "Custom"
    let keywords = "button custom flat rectangle outlined"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Outlined")
                    }
                    Button {} label: {
                        Label("Outlined", systemImage: "eye.fill")
                    }
                }
                .buttonStyle(OutlinedButton())
            }
        )
    }
}

struct FlatButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .flatButtons)
        }
        .primaryColor(.purple)
    }
}
