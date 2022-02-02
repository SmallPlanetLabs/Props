//
//  WarpDriveProgressStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 2/2/22.
//

import SwiftUI
import Props
import PreviewMultiple

extension PropGroup {
    static let warpDriveProgress = PropGroup(name: "Warp drive progress views", samples: [
        WarpDriveRandomProgressStyleSample(),
        WarpDriveTwirlProgressStyleSample(),
        WarpDriveVerticalProgressStyleSample(),
    ])
}

struct WarpDriveRandomProgressStyleSample: PropSampleable {
    let name = "WarpDrive random progress view"
    let notes: String? = ".progressViewStyle(.warpDrive(signature: .random))"
    let source = "Props"
    let keywords = "progress indeterminate custom warpdrive 3d rotation animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 12)
                .progressViewStyle(.warpDrive(signature: .random))
        )
    }
}

struct WarpDriveTwirlProgressStyleSample: PropSampleable {
    let name = "WarpDrive twirl progress view"
    let notes: String? = ".progressViewStyle(.warpDrive(signature: .twirl))"
    let source = "Props"
    let keywords = "progress indeterminate custom warpdrive 3d rotation animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 12)
                .progressViewStyle(.warpDrive(signature: .twirl))
        )
    }
}

struct WarpDriveVerticalProgressStyleSample: PropSampleable {
    let name = "WarpDrive vertical progress view"
    let notes: String? = ".progressViewStyle(.warpDrive(signature: .vertical))"
    let source = "Props"
    let keywords = "progress indeterminate custom warpdrive 3d rotation animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 12)
                .progressViewStyle(.warpDrive(signature: .vertical))
        )
    }
}
