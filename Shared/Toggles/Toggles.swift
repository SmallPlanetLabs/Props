//
//  Toggles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

struct Toggles: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("System Toggle Styles").font(.title)
                SystemToggleStyles()

                Divider()
            }
            .padding()
        }
    }
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        Toggles()
    }
}
