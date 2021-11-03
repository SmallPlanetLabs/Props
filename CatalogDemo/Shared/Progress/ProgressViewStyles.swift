//
//  SystemProgressViewStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct ProgressViewStyles: View {
    init(title: String, hideDeterminate: Bool = false, hideIndeterminate: Bool = false) {
        self.title = title
        self.hideDeterminate = hideDeterminate
        self.hideIndeterminate = hideIndeterminate
    }

    let title: String
    let hideDeterminate: Bool
    let hideIndeterminate: Bool

    @State private var value: Double = 0
    let progress = Foundation.Progress(totalUnitCount: 11)
    let total: Double = 11

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            HStack {
                Text(title).font(.caption)
                Spacer()
            }

            Group {
                if !hideIndeterminate {
                    ProgressView()
                    ProgressView(value: value, total: total)
                }

                if !hideDeterminate {
                    ProgressView("Downloading photo \(Int(value)) of \(Int(total))", value: value, total: total)
                    ProgressView(progress)
                }
            }
            .padding(.vertical, 15)
        }
        .padding()
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
