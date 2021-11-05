//
//  BrandrBrand.swift
//  Brandr
//
//  Created by Quinn McHenry on 11/5/21.
//

import SwiftUI

extension Font {
    static let h1 = Font.custom("Lora-Bold", size: 28)
    static let h2 = Font.custom("Lora-Bold", size: 22)
    static let h3 = Font.custom("Lora-Bold", size: 16)
    static let bodyStyle = Font.custom("Barlow-Regular", size: 12)
}

struct BrandrBrand_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 20) {
            Text("Text in H1").font(.h1)
            Text("Text in H2").font(.h2)
            Text("Text in H3").font(.h3)
            Text("The quick dilute tortie jumped onto the keyboard during a zoom call.").font(.bodyStyle)
        }
    }
}
