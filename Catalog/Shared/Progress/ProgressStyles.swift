//
//  ProgressStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/19/21.
//

import SwiftUI
import Props
import PreviewMultiple

extension PropGroup {
    static let customProgress = PropGroup(name: "Custom progress views", samples: [
        RotatingCirclesProgressStyleSample(),
        BarsProgressStyleSample(),
        ArcsProgressStyleSample(),
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
    let keywords = "progress determinate custom squiggle animated animation"
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
    let keywords = "progress determinate custom circles animated animation"
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
    let keywords = "progress determinate custom dotted dots animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 12)
                .progressViewStyle(DottedProgressStyle())
        )
    }
}

struct BarsProgressStyleSample: PropSampleable {
    let name = "Bars progress view"
    let notes: String? = ".progressViewStyle(.bars)"
    let source = "Props"
    let keywords = "progress determinate custom bars"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 100)
                .progressViewStyle(.bars)
        )
    }
}

struct ArcsProgressStyleSample: PropSampleable {
    let name = "Arcs progress view"
    let notes: String? = ".progressViewStyle(.arcs)"
    let source = "Props"
    let keywords = "progress determinate custom arcs"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 100)
                .progressViewStyle(.arcs)
        )
    }
}

struct RotatingCirclesProgressStyleSample: PropSampleable {
    let name = "Rotating circles progress view"
    let notes: String? = ".progressViewStyle(.rotatingCircles)"
    let source = "Props"
    let keywords = "progress determinate custom rotating circles"
    @ViewBuilder var body: AnyView {
        AnyView(
            ProgressExample(total: 100)
                .progressViewStyle(.rotatingCircles)
        )
    }
}

struct CustomProgressViewStyles_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .iPhone13ProMaxSizeCategories) {
            PropGroupView(group: .customProgress)
                .primaryColor(.purple)
                .secondaryColor(.gray)
        }
    }
}
