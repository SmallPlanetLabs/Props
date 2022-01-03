//
//  PropGroup.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/15/21.
//

import SwiftUI

struct PropGroup: Identifiable {
    let name: String
    let samples: [PropSampleable]
    let subgroups: [PropGroup]
    var id: String { return name }

    var hasGroupsAndSamples: Bool { !(subgroups.isEmpty && samples.isEmpty) }

    init(name: String, samples: [PropSampleable] = [], subgroups: [PropGroup] = []) {
        self.name = name
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
    ])
}

// MARK: - View

struct PropGroupView: View {
    let group: PropGroup
    @State private var queryString = ""
    var isSearchActive: Bool { !queryString.isEmpty }
    var isSearchHasResults: Bool { isSearchActive && filteredComponents.isEmpty }
    var filteredComponents: [PropSampleable] { group.getSamples(by: queryString) }

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
                VStack {
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
        .navigationViewStyle(.automatic)
        .background(Color.background.edgesIgnoringSafeArea(.all))
        .searchable(text: $queryString, prompt: "Search Components")
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
        HStack {
            Text(group.name)
            Spacer()
            Image(systemName: "greaterthan")
        }
        .frame(height: 44)
    }
}

struct PropGroupView_Previews: PreviewProvider {
    private static let groups: [PropGroup] = [.materialButtons, .systemButtons]
    private static let samples: [PropSampleable] = PropGroup.systemButtons.samples
    private static let group = PropGroup(name: "Test group", samples: samples, subgroups: groups)
    static var previews: some View {
        Group {
            NavigationView {
                PropGroupView(group: PropGroup(name: "Test Subgroups", subgroups: groups))
            }

            NavigationView {
                PropGroupView(group: PropGroup(name: "Test Samples", samples: samples))
            }
            .preferredColorScheme(.dark)
        }
    }
}
