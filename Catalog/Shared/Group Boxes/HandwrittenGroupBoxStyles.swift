//
//  HandwrittenGroupBoxStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/30/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let handwrittenGroupBoxes = PropGroup(name: "Handwritten group boxes", samples: [
        HandwrittenGroupBoxSample(),
    ])
}

struct HandwrittenGroupBoxSample: PropSampleable {
    
    // MARK: - Properties
    let name = "Handwritten group box style"
    let notes: String? = ".groupBoxStyle(HandwrittenGroupBoxStyle(shape: .shape1))"
    let source = "Props"
    let keywords = "group box handwritten"
    
    // MARK: - ViewBuilder
    @ViewBuilder var body: AnyView {
        AnyView(
            GroupBox(label: Label("Title Label", systemImage: "person")) {
                Text("GroupBox Content")
                    .font(Font.custom("ChalkboardSE-Light", fixedSize: 16))
            }
            .groupBoxStyle(HandwrittenGroupBoxStyle(shape: .shape1))
        )
    }
}

struct HandwrittenGroupBoxSamples: View {
    var body: some View {
        PropGroupView(group: .handwrittenGroupBoxes)
    }
}

struct HandwrittenGroupBoxSamples_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            HandwrittenGroupBoxSamples()
        }
    }
}
