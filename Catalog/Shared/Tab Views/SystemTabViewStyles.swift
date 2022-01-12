//
//  SystemTabViewStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/23/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemTabViews = PropGroup(name: "System tab views",
                                          samples: [
                                              DefaultTabViewSample(),
                                              PageTabViewSample()
                                          ])
}

struct DefaultTabViewSample: PropSampleable {
    let name = "Default tab view style"
    let notes: String? = ".tabViewStyle(.automatic)"
    let source = "System"
    let keywords = "tab view system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            TabView {
                Text("First")
                    .tabItem({ Label("First", systemImage: "1.circle.fill")})
                Text("Second")
                    .tabItem({ Label("Second", systemImage: "2.circle.fill")})
                Text("Third")
                    .tabItem({ Label("Third", systemImage: "3.circle.fill")})
                Text("Fourth")
                    .tabItem({ Label("Fourth", systemImage: "4.circle.fill")})
            }
            .frame(height: 200)
                .tabViewStyle(.automatic)
        )
    }
}

struct PageTabViewSample: PropSampleable {
    let name = "Page tab view style"
    let notes: String? = ".tabViewStyle(.page)"
    let source = "System"
    let keywords = "tab view system page"
    @ViewBuilder var body: AnyView {
        AnyView(
            TabView {
                Text("First")
                Text("Second")
                Text("Third")
                Text("Fourth")
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        )
    }
}

struct SystemTabViewStyles: View {
    var body: some View {
        PropGroupView(group: .systemTabViews)
    }
}

struct SystemTabViewStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemTabViewStyles()
    }
}
