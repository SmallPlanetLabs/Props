//
//  Catalog.swift
//  Shared
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct Catalog: View {
    var body: some View {
        PropGroupView(group: .allGroups)
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Catalog()
        }
    }
}
