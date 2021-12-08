//
//  NeumorphicButtonStyles.swift
//  Catalog
//
//  Created by Djuro on 12/7/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let neumorphicButtons = PropGroup(name: "Neumorphic buttons", samples: [
        NeumorphicButtonSample(),
    ])
}

struct NeumorphicButtonSample: PropSampleable {
    
    // MARK: - Properties
    let name = "Neumorphic button style"
    let notes: String? = ".buttonStyle(NeumorphicStyle())"
    let source = "Neumorphic"
    let keywords = "button neumorphic default"
    
    // MARK: - ViewBuilder
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                VStack {
                    Button {} label: {
                        Text("Neumorph Button")
                    }
                    .buttonStyle(NeumorphicStyle())
                }
            }
        )
    }
}
