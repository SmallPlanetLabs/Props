//
//  HandwrittenButtonStyles.swift
//  Catalog
//
//  Created by Djuro on 12/10/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let handwrittenButtons = PropGroup(name: "Handwritten buttons", samples: [
        HandwrittenButtonSample(),
    ])
}

struct HandwrittenButtonSample: PropSampleable {
    
    // MARK: - Properties
    let name = "Handwritten button style"
    let notes: String? = ".buttonStyle(HandwrittenButtonStyle())"
    let source = "Props"
    let keywords = "button handwritten default"
    
    // MARK: - ViewBuilder
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                VStack {
                    Button {} label: {
                        Text("Handwritten Button")
                    }
                    .buttonStyle(HandwrittenButtonStyle(shape: .shape1))
                }
            }
        )
    }
}

struct HandwrittenButtonSamples: View {
    var body: some View {
        PropGroupView(group: .handwrittenButtons)
    }
}

struct HandwrittenButtonSample_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            HandwrittenButtonSamples()
        }
    }
}
