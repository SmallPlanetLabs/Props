//
//  CustomButtons.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/16/21.
//

import SwiftUI
import Props
import PreviewMultiple

extension PropGroup {
    static let customButtons = PropGroup(name: "Custom buttons",
                                         samples: [PaperShadowedButtonSample()])
}

struct PaperShadowedButtonSample: PropSampleable {
    let name = "Paper shadowed button style"
    let notes: String? = ".buttonStyle(.paperShadowed)"
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
                .buttonStyle(.paperShadowed)
                .primaryColor(Color(white: 0.5))
            }
        )
    }
}

struct CustomButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .default) {
            PropGroupView(group: .customButtons)
        }
        .primaryColor(.purple)
    }
}
