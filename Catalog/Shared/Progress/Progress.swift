//
//  Progress.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let progress = PropGroup(name: "Progress", systemImage: "stopwatch.fill", subgroups: [
        .customProgress,
        .systemProgress,
    ])
}



struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        PropGroupView(group: .progress)
    }
}

// MARK: - Helpers

// Example for determinate progress view (known total value)
struct ProgressExample: View {
    let title: String?
    @State private var value: Double = 0
    let progress: Foundation.Progress
    let total: Double

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            if let title = title {
                HStack {
                    Text(title).font(.caption)
                    Spacer()
                }
            }

            ProgressView(progress)
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

    init(title: String? = nil, total: Double = 11) {
        self.title = title
        self.total = total
        progress = Foundation.Progress(totalUnitCount: Int64(total))
    }
}

// Example for an indeterminate progress view (total value not known)
struct ProgressIndeterminateExample: View {
    let title: String?

    var body: some View {
        VStack {
            if let title = title {
                HStack {
                    Text(title).font(.caption)
                    Spacer()
                }
            }

            ProgressView()
        }
        .padding()
    }

    init(title: String? = nil, total: Double = 11) {
        self.title = title
    }
}
