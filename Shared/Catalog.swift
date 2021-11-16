//
//  Catalog.swift
//  Shared
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct Catalog: View {
    var body: some View {
        List {
            ForEach(PropGroup.allGroups.subgroups) { group in
                NavigationLink(group.name, destination: PropGroupView(group: group))
            }
            .navigationTitle(PropGroup.allGroups.name)
        }
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Catalog()
        }
    }
}
