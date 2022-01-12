//
//  ProgressStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/19/21.
//

import SwiftUI
import Props

extension PropGroup {
    static let customProgress = PropGroup(name: "Custom progress views", samples: [
        SquiggleProgressStyleSample(),
        CircleBarProgressStyleSample(),
        CircleStepProgressStyleSample(),
        DottedProgressStyleSample(),
    ])
}

struct SquiggleProgressStyleSample: PropSampleable {
    let name = "Squiggle progress view"
    let notes: String? = ".progressViewStyle(SquiggleProgressStyle())"
    let source = "Props"
    let keywords = "progress determinate custom squiggle"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 12)
                .progressViewStyle(SquiggleProgressStyle())
        )
    }
}

struct CircleBarProgressStyleSample: PropSampleable {
    let name = "Circle bar progress view"
    let notes: String? = ".progressViewStyle(CircleBarProgressStyle())"
    let source = "Props"
    let keywords = "progress determinate custom circles"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 15)
                .progressViewStyle(CircleBarProgressStyle())
        )
    }
}

struct CircleStepProgressStyleSample: PropSampleable {
    let name = "Circle step progress view"
    let notes: String? = ".progressViewStyle(CircleStepProgressStyle())"
    let source = "Props"
    let keywords = "progress determinate custom circles"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 3)
                .progressViewStyle(CircleStepProgressStyle(total: 3))
        )
    }
}

struct DottedProgressStyleSample: PropSampleable {
    let name = "Dotted progress view"
    let notes: String? = ".progressViewStyle(DottedProgressStyle())"
    let source = "Props"
    let keywords = "progress determinate custom dotted dots"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 12)
                .progressViewStyle(DottedProgressStyle())
        )
    }
}

struct CustomProgressViewStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices(combos: .iPhone13ProMaxSizeCategories) {
            PropGroupView(group: .customProgress)
                .primaryColor(.purple)
                .secondaryColor(.gray)
        }
    }
}
