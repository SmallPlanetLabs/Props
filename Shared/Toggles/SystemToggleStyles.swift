//
//  SystemToggleStyles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI

struct SystemToggleStyles: View {
    var body: some View {
        VStack {
            ToggleExample(title: ".switch") {
                Text("Are you open to travel?")
            }
            .toggleStyle(.switch)

            if #available(iOS 15.0, *) {
                ToggleExample(title: ".button") {
                    Text("Are you open to travel?")
                }
                .toggleStyle(.button)
            } else {
                Text(".button style only available in iOS 15 and above")
            }
        }
    }
}

struct SystemToggleStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemToggleStyles()
            .padding()
    }
}
