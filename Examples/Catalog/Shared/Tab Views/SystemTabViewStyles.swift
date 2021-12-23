//
//  SystemTabViewStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/23/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemTabViews = PropGroup(name: "System tab views", samples: [
        DefaultTabViewSample(),
        PageTabViewSample()
    ])
}

struct DefaultTabViewSample: PropSampleable {
    let name = "Default tab view style"
    let notes: String? = ".tabViewStyle(DefaultTabViewStyle())"
    let source = "System"
    let keywords = "tab view system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            TabView {
                Text("First")
                Text("Second")
                Text("Third")
                Text("Fourth")
            }
            .frame(height: 200)
            .tabViewStyle(DefaultTabViewStyle())
        )
    }
}

struct PageTabViewSample: PropSampleable {
    let name = "Page tab view style"
    let notes: String? = ".tabViewStyle(PageTabViewStyle())"
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
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
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
