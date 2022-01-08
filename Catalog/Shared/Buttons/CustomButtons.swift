//
//  CustomButtons.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/16/21.
//

import SwiftUI

import Props

extension PropGroup {
    static let customButtons = PropGroup(name: "Custom buttons", samples: [
        PaperShadowedButtonSample(),
    ])
}

struct PaperShadowedButtonSample: PropSampleable {
    let name = "Paper shadowed button style"
    let notes: String? = ".buttonStyle(PaperShadowedButton())"
    let source = "Props"
    let keywords = "button custom flat rectangle outlined"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: {
                        Text("Paper Button")
                    }
                    Button {} label: {
                        Label("Paper", systemImage: "heart.fill")
                    }
                }
                .buttonStyle(PaperShadowedButtonStyle())
            }
        )
    }
}

struct CustomButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .defaults) {
            PropGroupView(group: .customButtons)
        }
        .primaryColor(.purple)
    }
}
