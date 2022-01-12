//
//  VerticalLabelStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 1/4/22.
//

import Props
import SwiftUI

extension PropGroup {
    static let verticalLabels = PropGroup(name: "Vertical labels",
                                          samples: [
                                              VerticalLabelSample(),
                                          ])
}

struct VerticalLabelSample: PropSampleable {
    
    // MARK: - Properties
    let name = "Vertical label style"
    let notes: String? = ".labelStyle(.vertical(spacing: 10))"
    let source = "Props"
    let keywords = "label vertical style"
    
    // MARK: - ViewBuilder
    @ViewBuilder var body: AnyView {
        AnyView(
            Label {
                Text("Label")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            } icon: {
                Image(systemName: "pencil.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
                .labelStyle(.vertical(spacing: 10))
        )
    }
}

struct VerticalLabelSamples: View {
    var body: some View {
        PropGroupView(group: .verticalLabels)
    }
}

struct VerticalLabelSamples_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .lightDarkiPhoneBig) {
            VerticalLabelSamples()
        }
    }
}
