//
//  MaterialButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import Props

struct MaterialButtonStyles: View {
    var body: some View {
        VStack {
            EnabledAndDisabled(title: "MonochromaricMaterial") {
                VStack {
                    Button {} label: { Image(systemName: "plus") }
                    .buttonStyle(MonochromaricMaterial(color: Color(hex: 0x9A513D)))

                    Button {} label: { Text("Send").padding(.horizontal) }
                    .buttonStyle(MonochromaricMaterial(color: Color(hex: 0x097660)))

                    Button {} label: { Image(systemName: "stopwatch") }
                    .buttonStyle(MonochromaricMaterial(color: Color(hex: 0x65889b)))
                }
            }
        }
        .font(.custom("ArialRoundedMTBold", fixedSize: 24))
    }
}

struct MaterialButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            MaterialButtonStyles()
                .padding()
        }
    }
}
