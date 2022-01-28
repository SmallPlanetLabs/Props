//
//  TintingShading.swift
//  Catalog
//
//  Created by Quinn McHenry on 12/9/21.
//

import SwiftUI
import DynamicColor
import Props

extension PropGroup {
    static let tintingShading = PropGroup(name: "Color tinting and shading", samples: [
        ColorTintingSample(),
        ColorShadingSample(),
    ])
}

struct TintingShading_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            PropGroupView(group: .tintingShading)
        }
    }
}

// MARK: - Samples

struct ColorTintingSample: PropSampleable {
    let name = "Exploring color tinting"
    let notes: String? = nil
    let source = "DynamicColor"
    let keywords = "color theory example tinting tinted lighter lightening"
    @ViewBuilder var body: AnyView {
        AnyView(ShadingTintingDemo(shading: false))
    }
}

struct ColorShadingSample: PropSampleable {
    let name = "Exploring color shading"
    let notes: String? = nil
    let source = "DynamicColor"
    let keywords = "color theory example shading shaded darker darkening"
    @ViewBuilder var body: AnyView {
        AnyView(ShadingTintingDemo(shading: true))
    }
}

/// Complete table showing tinging or shading examples on three colors: black, white, and blue
///     `shading` set to true to show the example with different amounts of shading, false for tinting
struct ShadingTintingDemo: View {
    let shading: Bool

    private let labelWidth: CGFloat = 80
    private let height: CGFloat = 24

    var body: some View {
        VStack {
            HStack {
                Text("Amount").frame(width: labelWidth)
                Text("Black").frame(maxWidth: .infinity)
                Text("White").frame(maxWidth: .infinity)
                Text("Blue").frame(maxWidth: .infinity)
            }
            row(amount: 0)
            row(amount: 0.2)
            row(amount: 0.4)
            row(amount: 0.6)
            row(amount: 0.8)
            row(amount: 1)
        }
    }

    /// One row of the shading/tinting demo, has a label with the tint/shade amount and three color swatches with the desired effect applied
    func row(amount: CGFloat) -> some View {
        HStack {
            Text(String(format: "%0.2f", amount))
                .frame(width: labelWidth)
            block(color: tintOrShade(.black, amount: amount))
            block(color: tintOrShade(.white, amount: amount))
            block(color: tintOrShade(.blue, amount: amount))
        }
        .frame(height: height)
    }

    /// shade the color if `shading` is true, otherwise tint
    func tintOrShade(_ color: Color, amount: CGFloat) -> Color {
        shading ? color.shaded(amount: amount) : color.tinted(amount: amount)
    }

    /// Outlined rectangle filled with color
    func block(color: Color) -> some View {
        ZStack {
            Rectangle()
                .fill(color)
            Rectangle()
                .stroke(Color.gray, lineWidth: 1)
        }
    }
}
