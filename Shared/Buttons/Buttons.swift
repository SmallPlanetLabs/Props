//
//  Buttons.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import Props

extension PropGroup {
    static let buttons = PropGroup(name: "Buttons", subgroups: [
        .systemButtons,
        .materialButtons
    ])
}

struct Buttons: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("MaterialButtonStyles").font(.title)
                MaterialButtonStyles()

                Divider()
                    .padding(.top, 30)

                Text("ButtonStyles").font(.title)
                ButtonStyles()

                Divider()
                    .padding(.top, 30)

                Text("SystemButtonStyles").font(.title)
                SystemButtonStyles()
                    .padding(.bottom, 100)

            }
            .padding()
            .navigationTitle("Buttons")
        }
    }
}

struct AllButtonStyles: View {
    var body: some View {
        VStack {
            ButtonStyles()
            SystemButtonStyles()
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .buttons)
                .padding()
        }
    }
}
