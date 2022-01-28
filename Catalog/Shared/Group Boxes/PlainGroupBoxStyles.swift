//
//  PlainGroupBoxStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/30/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let plainGroupBoxes = PropGroup(name: "Plain group boxes", samples: [
        PlainGroupBoxSample(),
    ])
}

struct PlainGroupBoxSample: PropSampleable {
    
    // MARK: - Properties
    let name = "Plain group box style"
    let notes: String? = ".groupBoxStyle(PlainGroupBoxStyle())"
    let source = "Props"
    let keywords = "group box plain default"
    
    // MARK: - ViewBuilder
    @ViewBuilder var body: AnyView {
        AnyView(
            GroupBox(
                label: Label("Heart Rate", systemImage: "heart.fill")
                    .foregroundColor(.red)
            ) {
                Text("Your hear rate is 90 BPM.")
            }
            .groupBoxStyle(PlainGroupBoxStyle())
        )
    }
}

struct PLainGroupBoxSamples: View {
    var body: some View {
        PropGroupView(group: .plainGroupBoxes)
    }
}

struct PlainGroupBoxSamples_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            PLainGroupBoxSamples()
        }
    }
}
