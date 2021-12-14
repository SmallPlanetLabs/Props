//
//  SystemProgressViewStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

extension PropGroup {
    static let systemProgress = PropGroup(name: "System progress views", samples: [
        SystemDeterminateSample(),
        SystemIndeterminateSample()
    ])
}

struct SystemDeterminateSample: PropSampleable {
    let name = "Default determinate progress view"
    let notes: String? = nil
    let source = "System"
    let keywords = "progress determinate system"
    @ViewBuilder var body: AnyView {
        AnyView( ProgressExample(total: 12))
    }
}

struct SystemIndeterminateSample: PropSampleable {
    let name = "Default indeterminate progress view"
    let notes: String? = nil
    let source = "System"
    let keywords = "progress indeterminate system"
    @ViewBuilder var body: AnyView {
        AnyView( ProgressIndeterminateExample())
    }
}

struct SystemProgressViewStyles_Previews: PreviewProvider {
    static var previews: some View {
        PropGroupView(group: .systemProgress)
    }
}
