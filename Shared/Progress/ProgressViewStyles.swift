//
//  SystemProgressViewStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct ProgressViewStyles: View {
    init(title: String, total: Double = 11, hideDeterminate: Bool = false, hideIndeterminate: Bool = false) {
        self.title = title
        self.total = total
        self.progress = Foundation.Progress(totalUnitCount: Int64(total))
        self.hideDeterminate = hideDeterminate
        self.hideIndeterminate = hideIndeterminate
    }

    let title: String
    let hideDeterminate: Bool
    let hideIndeterminate: Bool

    @State private var value: Double = 0
    let progress: Foundation.Progress
    let total: Double

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
                }

                if !hideDeterminate {
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
