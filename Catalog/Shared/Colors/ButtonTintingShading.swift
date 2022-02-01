//
//  ButtonTintingShading.swift
//  Catalog
//
//  Created by Quinn McHenry on 1/5/22.
//

import SwiftUI
import DynamicColor
import Props
import PreviewMultiple

extension PropGroup {
    static let buttonTintingShading = PropGroup(name: "Button tinting and shading", samples: [
        ButtonTintingShadingSample(),
    ])
}

struct ButtonTintingShading_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBigLandscape) {
            PropGroupView(group: .buttonTintingShading)
        }
    }
}

// MARK: - Samples

struct ButtonTintingShadingSample: PropSampleable {
    let name = "Exploring color tinting for button states"
    let notes: String? = nil
    let source = "DynamicColor"
    let keywords = "color theory example tinting tinted lighter lightening"
    @ViewBuilder var body: AnyView {
        AnyView(ButtonTintingShadingDemo(amount: 0.25))
    }
}

/// Complete table showing tinging or shading examples on three colors: black, white, and blue
///     `shading` set to true to show the example with different amounts of shading, false for tinting
struct ButtonTintingShadingDemo: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let amount: CGFloat

    private let labelWidth: CGFloat = 140
    private let height: CGFloat = 24

    var body: some View {
        VStack {
            HStack {
                Text("enabled / pressed").frame(width: labelWidth)
                Text("fg").frame(maxWidth: .infinity)
                Text("bg").frame(maxWidth: .infinity)
                Text("red").frame(maxWidth: .infinity)
            }
            HStack {
                Text("Unmodified").frame(width: labelWidth)
                block(color: .foreground)
                block(color: .background)
                block(color: .red)
            }
            .frame(height: height)
            row(isEnabled: true, isPressed: false)
            row(isEnabled: true, isPressed: true)
            row(isEnabled: false, isPressed: false)
            row(isEnabled: false, isPressed: true)
        }
    }

    /// One row of the shading/tinting demo, has a label with the tint/shade amount and three color swatches with the desired effect applied
    func row(isEnabled: Bool, isPressed: Bool) -> some View {
        func rowBlock(color: Color) -> some View {
            block(color: color.tintOrShade(for: colorScheme, isEnabled: isEnabled, isActive: isPressed, amount: amount))
        }
        return HStack {
            Text("\(isEnabled ? "enabled" : "disabled") / \(isPressed ? "pressed" : "normal")")
                .frame(width: labelWidth)
            rowBlock(color: .foreground)
            rowBlock(color: .background)
            rowBlock(color: .red)
        }
        .frame(height: height)
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
