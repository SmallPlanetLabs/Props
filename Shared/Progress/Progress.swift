//
//  Progress.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI
import Props

struct Progress: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Custom Progress View Styles").font(.title)

                ProgressViewStyles(title: "SquiggleProgressStyle", total: 4, hideIndeterminate: true)
                    .progressViewStyle(SquiggleProgressStyle())


                ProgressViewStyles(title: "CircleBarProgressStyle", hideIndeterminate: true)
                    .progressViewStyle(CircleBarProgressStyle())

                ProgressViewStyles(title: "CircleStepProgressStyle", total: 3, hideIndeterminate: true)
                    .progressViewStyle(CircleStepProgressStyle(total: 3))

                ProgressViewStyles(title: "DottedProgressStyle", hideIndeterminate: true)
                    .progressViewStyle(DottedProgressStyle())

                Text("SystemProgressViewStyles").font(.title)

                ProgressViewStyles(title: "CircularProgressViewStyle")
                    .progressViewStyle(CircularProgressViewStyle())

                ProgressViewStyles(title: "DefaultProgressViewStyle")
                    .progressViewStyle(DefaultProgressViewStyle())

            }
            .padding()
            .navigationTitle("Progress")
            .environment(\.primaryColor, .purple)
            .environment(\.secondaryColor, .purple.opacity(0.3))
        }
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}
