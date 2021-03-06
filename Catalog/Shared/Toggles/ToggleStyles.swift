//
//  ToggleStyles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import Props
import SunMoonToggleStyle
import SwiftUI
import PreviewMultiple

extension PropGroup {
    static let customToggles = PropGroup(name: "Custom toggles", samples: [
        ScantronToggleSample(),
        RolloverToggleSample(),
        GravityToggleSample(),
        CheckboxToggleSample(),
        SunMoonToggleSample(),
    ])
}

struct ScantronToggleSample: PropSampleable {
    let name = "Scantron toggle style"
    let notes: String? = ".toggleStyle(.scantron)"
    let source = "Props"
    let keywords = "toggle custom props scantron handdrawn animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ScantronToggleSampleView()
                .secondaryColor(.blue)
        )
    }
}

struct ScantronToggleSampleView: View {
    var body: some View {
        VStack {
            ScantronRow(baseId: 10)
            ScantronRow(baseId: 20)
            ScantronRow(baseId: 30)
            ScantronRow(baseId: 40)
        }
    }

    struct ScantronSample: View {
        @State private var isOn = false
        let id: Int
        var body: some View {
            Toggle(isOn: $isOn) {}
                .id(id)
                .toggleStyle(.scantron(seed: id))
        }
    }

    struct ScantronRow: View {
        let baseId: Int
        var body: some View {
            HStack {
                ScantronSample(id: baseId + 1)
                ScantronSample(id: baseId + 2)
                ScantronSample(id: baseId + 3)
                ScantronSample(id: baseId + 4)
                ScantronSample(id: baseId + 5)
            }
        }
    }
}

struct CheckboxToggleSample: PropSampleable {
    let name = "Checkbox toggle style"
    let notes: String? = ".toggleStyle(.checkbox)"
    let source = "Props"
    let keywords = "toggle custom props checkbox"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: nil) {
                Text("Do the thing?")
            }
            .toggleStyle(.checkBox)
        )
    }
}

struct SunMoonToggleSample: PropSampleable {
    let name = "Sun/moon toggle style"
    let notes: String? = ".toggleStyle(SunMoonToggleStyle())"
    let source = "Custom"
    let keywords = "toggle custom 3rd party animated animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: nil) {
                Text("Sun or moon?")
            }
            .toggleStyle(SunMoonToggleStyle())
        )
    }
}

struct GravityToggleSample: PropSampleable {
    let name = "gravity toggle style"
    let notes: String? = ".toggleStyle(.gravity)"
    let source = "Custom"
    let keywords = "toggle custom props animated gravity animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: nil) {
                Text("")
            }
            .toggleStyle(.gravity)
            .primaryColor(.foreground)
            .secondaryColor(.background)
        )
    }
}

struct RolloverToggleSample: PropSampleable {
    let name = "rollover toggle style"
    let notes: String? = ".toggleStyle(.rollover)"
    let source = "Custom"
    let keywords = "toggle custom props animated rollover animated animation"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: nil) {
                Text("")
            }
            .toggleStyle(.rollover)
            .primaryColor(.foreground)
            .secondaryColor(.background)
        )
    }
}

struct CustomToggleStyles_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMultiple(devices: .lightDarkiPhoneBig) {
            PropGroupView(group: .customToggles)
                .primaryColor(.foreground)
        }
    }
}
