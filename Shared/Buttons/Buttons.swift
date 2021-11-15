//
//  Buttons.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import Props

extension PropCatalog {
    static let buttons: [PropGroup] = [
        PropGroup(name: "System buttons", group: systemButtons),
        PropGroup(name: "Material buttons", group: materialButtons)
    ]
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
            ScrollView {
                VStack {
                    ForEach(PropCatalog.buttons, id: \.name) { group in
                        ForEach(group.group, id: \.name) { sample in
                            PropCard(sample: sample)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
