//
//  ToggleStyles.swift
//  Catalog (iOS)
//
//  Created by Quinn McHenry on 11/3/21.
//

import SwiftUI
import Props
import SunMoonToggleStyle

extension PropGroup {
    static let customToggles = PropGroup(name: "Custom toggles", samples: [
        SunMoonToggleSample(),
        CheckboxToggleSample()
    ])
}

struct CheckboxToggleSample: PropSampleable {
    let name = "Checkbox toggle style"
    let notes: String? = ".toggleStyle(CheckboxStyle())"
    let source = "Props"
    let keywords = "toggle custom props checkbox"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: nil) {
                Text("Do the thing?")
            }
            .toggleStyle(CheckBoxStyle())
        )
    }
}

struct SunMoonToggleSample: PropSampleable {
    let name = "Sun/moon toggle style"
    let notes: String? = ".toggleStyle(SunMoonToggleStyle())"
    let source = "Custom"
    let keywords = "toggle custom 3rd party animated"
    @ViewBuilder var body: AnyView {
        AnyView(
            ToggleExample(title: nil) {
                Text("Sun or moon?")
            }
            .toggleStyle(SunMoonToggleStyle())
        )
    }
}

struct CustomToggleStyles_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDevices {
            PropGroupView(group: .customToggles)
                .primaryColor(.foreground)
        }
        .preferredColorScheme(.dark)
    }
}
