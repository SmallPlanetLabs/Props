//
//  MultipleDevices.swift
//  smallplanet.com
//
//  Created by Ryan Goodlett on 5/18/21.
//

import SwiftUI

/// Create SwiftUI previews on multiple devices
///
/// There are several predefined MultiplePreviewCombo static vars including `defaults` which defines the set of
/// device configuration combinations to show when `combos` is not supplied. Because these are arrays, they can
/// be added together as shown below.
///
///      struct FlatButtonStyles_Previews: PreviewProvider {
///          static var previews: some View {
///              MultipleDevices(combos: .lightDarkiPhoneBig + .lightDarkiPhoneSmall) {
///                  Text("Cool SwiftUI stuff here")
///              }
///          }
///      }
///
public struct MultipleDevices<Content: View>: View {
    let combos: [PreviewCombo]
    let content: Content

    public init(combos: MultiplePreviewCombo = .defaults, @ViewBuilder content: () -> Content) {
        self.combos = combos
        self.content = content()
    }

    public var body: some View {
        ForEach(combos, id: \.name) { combo in
            content
                .previewDevice(SwiftUI.PreviewDevice(rawValue: combo.device.name))
                .previewDisplayName(combo.name)
                .colorScheme(combo.colorScheme)
                .backport.previewInterfaceOrientation(combo.orientation)
                .environment(\.sizeCategory, combo.sizeCategory)
        }
    }
}
