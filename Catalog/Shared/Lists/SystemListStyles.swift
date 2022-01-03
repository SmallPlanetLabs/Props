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
    let notes: String? = ".listStyle(.grouped)"
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
            .listStyle(.grouped)
            .frame(height: 200)
        )
    }
}

struct InsetGroupedListSample: PropSampleable {
    let name = "Inset grouped list style"
    let notes: String? = ".listStyle(.insetGrouped)"
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
                .listStyle(.insetGrouped)
            .frame(height: 200)
        )
    }
}

struct InsetListSample: PropSampleable {
    let name = "Inset list style"
    let notes: String? = ".listStyle(.inset)"
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
                .listStyle(.inset)
            .frame(height: 200)
        )
    }
}

struct PlainListSample: PropSampleable {
    let name = "Plain list style"
    let notes: String? = ".listStyle(.plain)"
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
                .listStyle(.plain)
            .frame(height: 200)
        )
    }
}

struct SidebarListSample: PropSampleable {
    let name = "Sidebar list style"
    let notes: String? = ".listStyle(.sidebar)"
    let source = "System"
    let keywords = "list system sidebar"
    @ViewBuilder var body: AnyView {
        AnyView(
            List {
                Section(header: Text("List")) {
                    Text("First")
                    Text("Second")
                    Text("Third")
                }
            }
            .listStyle(.sidebar)
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

