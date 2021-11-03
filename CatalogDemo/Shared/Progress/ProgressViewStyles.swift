//
//  SystemProgressViewStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct ProgressViewStyles: View {
    let title: String
    @State private var value: Double = 0
    let progress = Foundation.Progress(totalUnitCount: 1)
    let total: Double = 11

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            HStack {
                Text(title).font(.caption)
                Spacer()
            }

            Group {
                ProgressView()

                ProgressView(value: value, total: total)

                ProgressView("Downloading photo \(Int(value)) of \(Int(total))", value: value, total: total)

                ProgressView(progress)
            }
            .padding()
        }
        .onReceive(timer) { _ in
             value += 1
             progress.completedUnitCount += 1

             if value > total {
                 value = 0
                 progress.completedUnitCount = 0
             }
         }
    }
}

struct SystemProgressViewStyles_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewStyles(title: "DefaultProgressViewStyle")
    }
}
