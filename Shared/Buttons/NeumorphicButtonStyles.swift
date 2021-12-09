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
    let notes: String? = ".buttonStyle(NeumorphicButtonStyle())"
    let source = "Props"
    let keywords = "button neumorphic default"
    
    // MARK: - ViewBuilder
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                VStack {
                    Button {} label: {
                        Text("Neumorph Button")
                    }
                    .buttonStyle(NeumorphicButtonStyle())
                }
            }
        )
    }
}

struct NeumorphicButtonSamples: View {
    var body: some View {
        PropGroupView(group: .neumorphicButtons)
    }
}

struct NeumorphicButtonSample_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            NeumorphicButtonSamples()
        }
    }
}
