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
}

extension PropGroup {
    static let allGroups = PropGroup(name: "Prop Catalog", subgroups: [
        .buttons,
        .toggles,
        .progress,
    ])
}

// MARK: - View

struct PropGroupView: View {
    let group: PropGroup

    var body: some View {
        ScrollView {
            VStack {
                if !group.subgroups.isEmpty {
                    ForEach(group.subgroups) { subgroup in
                        NavigationLink(destination: PropGroupView(group: subgroup)) {
                            PropGroupRow(group: subgroup)
                        }
                    }
                    .navigationTitle(group.name)
                } else {
                    ForEach(group.samples, id: \.name) { sample in
                        PropCard(sample: sample)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(group.name)
        .navigationViewStyle(.automatic)
        .background(Color.background.edgesIgnoringSafeArea(.all))
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
