//
//  Buttons.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        ScrollView {
            AllButtonStyles()
                .navigationTitle("Buttons")
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
