//
//  PropGroup.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/15/21.
//

import SwiftUI
import Props
import PreviewMultiple

struct PropGroup: Identifiable {
    let name: String
    let systemImage: String?
    let samples: [PropSampleable]
    let subgroups: [PropGroup]
    var id: String { return name }

    var hasGroupsAndSamples: Bool { !(subgroups.isEmpty && samples.isEmpty) }

    init(name: String, systemImage: String? = nil, samples: [PropSampleable] = [], subgroups: [PropGroup] = []) {
        self.name = name
        self.systemImage = systemImage
        self.samples = samples
        self.subgroups = subgroups
    }

    func getSamples(by term: String) -> [PropSampleable] {
        samples.filter { $0.keywords.contains(term.lowercased()) } + subgroups.flatMap
        { $0.getSamples(by: term) }
    }
}

extension PropGroup {
    static let allGroups = PropGroup(name: "Prop Catalog", subgroups: [
        .buttons,
        .toggles,
        .progress,
        .colors,
        .textFields,
        .tabViews,
        .lists,
        .menus,
        .groupBoxes,
        .labels,
        .pickers,
        .datePickers,
        .controlGroups,
    ])
}

// MARK: - View

struct PropGroupView: View {
    let group: PropGroup
    @State private var queryString = ""
    var isSearchActive: Bool { !queryString.isEmpty }
    var isSearchHasResults: Bool { isSearchActive && filteredComponents.isEmpty }
    var filteredComponents: [PropSampleable] { group.getSamples(by: queryString) }
    let columns = [GridItem(.flexible(minimum: 300, maximum: 400)), GridItem(.flexible(minimum: 300, maximum: 400)), GridItem(.flexible(minimum: 300, maximum: 400))]

    var body: some View {
        ZStack {
            if isSearchHasResults {
                Rectangle()
                    .fill(Color.clear)
                    .overlay(
                        Text("No matching props")
                    )
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
                    if !isSearchActive {
                        if !group.subgroups.isEmpty {
                            ForEach(group.subgroups) { subgroup in
                                NavigationLink(destination: PropGroupView(group: subgroup)) {
                                    PropGroupRow(group: subgroup)
                                }
                            }
                            .navigationTitle(group.name)
                        } else {
                            sampleCards(for: group.samples)
                        }
                    } else {
                        sampleCards(for: filteredComponents)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(group.name)
        .background(Color.background.edgesIgnoringSafeArea(.all))
        .searchable(text: $queryString, prompt: "Search Props")
    }

    func sampleCards(for samples: [PropSampleable]) -> some View {
        ForEach(samples, id: \.name) { sample in
            PropCard(sample: sample)
        }
    }
}

struct PropGroupRow: View {
    let group: PropGroup

    var body: some View {
        Label(group.name, systemImage: group.systemImage ?? "book.closed")
            .labelStyle(.outlined(cornerRadius: 8))
            .foregroundColor(.foreground)
    }
}

struct PropGroupView_Previews: PreviewProvider {
    private static let groups: [PropGroup] = [.materialButtons, .systemButtons]
    private static let samples: [PropSampleable] = PropGroup.systemButtons.samples
    private static let group = PropGroup(name: "Test group", subgroups: groups)
    static var previews: some View {
        PreviewMultiple(devices: .iPadOrientations) {
            NavigationView {
                PropGroupView(group: PropGroup(name: "Test Samples", samples: samples))
            }
        }
        .navigationViewStyle(.stack)
    }
}
