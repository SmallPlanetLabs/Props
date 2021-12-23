//
//  SystemListStyles.swift
//  Catalog (iOS)
//
//  Created by Djuro on 12/23/21.
//

import Props
import SwiftUI

extension PropGroup {
    static let systemLists = PropGroup(name: "System lists", samples: [
        DefaultListSample(),
        GroupedListSample(),
        InsetGroupedListSample(),
        InsetListSample(),
        PlainListSample(),
        SidebarListSample()
    ])
}

struct DefaultListSample: PropSampleable {
    let name = "Default list style"
    let notes: String? = ".listStyle(DefaultListStyle())"
    let source = "System"
    let keywords = "list system default"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(DefaultListStyle())
            .frame(height: 200)
        )
    }
}

struct GroupedListSample: PropSampleable {
    let name = "Grouped list style"
    let notes: String? = ".listStyle(GroupedListStyle())"
    let source = "System"
    let keywords = "list system grouped"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(GroupedListStyle())
            .frame(height: 200)
        )
    }
}

struct InsetGroupedListSample: PropSampleable {
    let name = "Inset grouped list style"
    let notes: String? = ".listStyle(InsetGroupedListStyle())"
    let source = "System"
    let keywords = "list system inset grouped"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .frame(height: 200)
        )
    }
}

struct InsetListSample: PropSampleable {
    let name = "Inset list style"
    let notes: String? = ".listStyle(InsetListStyle())"
    let source = "System"
    let keywords = "list system inset"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(InsetListStyle())
            .frame(height: 200)
        )
    }
}

struct PlainListSample: PropSampleable {
    let name = "Plain list style"
    let notes: String? = ".listStyle(PlainListStyle())"
    let source = "System"
    let keywords = "list system plain"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(PlainListStyle())
            .frame(height: 200)
        )
    }
}

struct SidebarListSample: PropSampleable {
    let name = "Sidebar list style"
    let notes: String? = ".listStyle(SidebarListStyle())"
    let source = "System"
    let keywords = "list system plain"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(height: 200)
        )
    }
}

struct SystemListStyles: View {
    var body: some View {
        PropGroupView(group: .systemLists)
    }
}

struct SystemListStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemListStyles()
    }
}

