//
//  Progress.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct Progress: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("SystemProgressViewStyles").font(.title)

                ProgressViewStyles(title: "CircularProgressViewStyle")
                    .progressViewStyle(CircularProgressViewStyle())

                ProgressViewStyles(title: "DefaultProgressViewStyle")
                    .progressViewStyle(DefaultProgressViewStyle())

            }
            .padding()
            .navigationTitle("Progress")
        }
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}
