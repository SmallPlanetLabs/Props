//
//  Catalog.swift
//  Shared
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct Catalog: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Buttons", destination: Buttons())
                NavigationLink("TextFields", destination: Buttons())
            }
            .navigationTitle("Catalog")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Catalog()
    }
}
