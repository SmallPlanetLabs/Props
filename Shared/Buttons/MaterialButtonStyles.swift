//
//  MaterialButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import DynamicColor

struct MaterialButtonStyles: View {
    var body: some View {
        VStack {
            Group {
                EnabledAndDisabled(title: "MonochromaricMaterial") {
                    Button {} label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(MonochromaricMaterial(color: Color(hex: 0x9A513D)))
                }

                EnabledAndDisabled(title: nil) {
                    Button {} label: {
                        Text("Send").padding(.horizontal)
                    }
                    .buttonStyle(MonochromaricMaterial(color: Color(hex: 0x097660)))
                }

                EnabledAndDisabled(title: nil) {
                    Button {} label: {
                        Image(systemName: "stopwatch")
                    }
                    .buttonStyle(MonochromaricMaterial(color: Color(hex: 0x65889b)))
                }
            }
        }
        .font(.custom("ArialRoundedMTBold", fixedSize: 24))

    }
}

struct MaterialButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MaterialButtonStyles()
            .padding()
    }
}

struct MonochromaricMaterial: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(color(for: configuration))

        configuration
            .label
            .padding()
            .foregroundColor(isEnabled ? color : disabled)
            .background(background)
    }

    var disabled: Color {
        color.shaded(amount: 0.5).tinted(amount: 0.5)
    }

    func color(for configuration: Configuration) -> Color {
        guard isEnabled else { return disabled.tinted(amount: 0.7) }
        return color.tinted(amount: configuration.isPressed ? 0.8 : 0.6)
    }
}

extension Color {
    func tinted(amount: CGFloat) -> Color {
        Color(DynamicColor(self).tinted(amount: amount).cgColor)
    }

    func shaded(amount: CGFloat) -> Color {
        Color(DynamicColor(self).shaded(amount: amount).cgColor)
    }
}
