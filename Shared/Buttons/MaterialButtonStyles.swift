//
//  MaterialButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let materialButtons = PropGroup(name: "Material buttons", samples: [
        MonochromaticMaterialSample(),
    ])
}

struct MonochromaticMaterialSample: PropSampleable {
    let name = "MonochromaticMaterial button style"
    let notes: String? = ".buttonStyle(MonochromaticMaterial())"
    let source = "Custom (Props package)"
    let keywords = "button custom flat material"
    @ViewBuilder var body: AnyView {
        AnyView(
            EnabledAndDisabled {
                HStack {
                    Button {} label: { Image(systemName: "plus") }
                        .primaryColor(Color(hex: 0x9A513D))

                    Button {} label: { Text("Send").padding(.horizontal) }
                        .primaryColor(Color(hex: 0x097660))

                    Button {} label: { Image(systemName: "stopwatch") }
                        .primaryColor(Color(hex: 0x65889B))
                }
                .buttonStyle(MonochromaticMaterial())
            }
        )
    }
}

struct MaterialButtonStyles: View {
    var body: some View {
        VStack {
            EnabledAndDisabled {
                VStack {
                    Button {} label: { Image(systemName: "plus") }
                        .primaryColor(Color(hex: 0x9A513D))

                    Button {} label: { Text("Send").padding(.horizontal) }
                        .primaryColor(Color(hex: 0x097660))

                    Button {} label: { Image(systemName: "stopwatch") }
                        .primaryColor(Color(hex: 0x65889B))
                }
                .buttonStyle(MonochromaticMaterial())
            }
        }
        .font(.custom("ArialRoundedMTBold", fixedSize: 24))
    }
}

struct MaterialButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .materialButtons)
        }
    }
}
