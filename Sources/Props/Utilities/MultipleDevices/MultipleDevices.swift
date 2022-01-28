//
//  PreviewMultiple.swift
//  smallplanet.com
//
//  Created by Ryan Goodlett on 5/18/21.
//

import SwiftUI

/// Create SwiftUI previews on multiple devices
///
/// There are several predefined `PreviewCombination` static vars including `default` which defines the set of
/// device configuration combinations to show when `devices` is not supplied. Because these are arrays, they can
/// be added together as shown below.
///
///      struct FlatButtonStyles_Previews: PreviewProvider {
///          static var previews: some View {
///              PreviewMultiple(devices: .lightDarkiPhoneBig + .lightDarkiPhoneSmall) {
///                  Text("Cool SwiftUI stuff here")
///              }
///          }
///      }
///
/// - Parameter devices: Array of `PreviewDevice` to present in previews
/// - Parameter content: View content to repeat for each `PreviewDevice` in `devices`
///

public struct PreviewMultiple<Content: View>: View {
    let devices: PreviewCombination
    let content: Content

    public init(devices: PreviewCombination = .default, @ViewBuilder content: () -> Content) {
        self.devices = devices
        self.content = content()
    }

    public var body: some View {
        ForEach(devices, id: \.name) { device in
            content
                .previewDevice(device.device)
                .previewDisplayName(device.name)
                .colorScheme(device.colorScheme)
                .backport.previewInterfaceOrientation(device.orientation)
                .environment(\.sizeCategory, device.sizeCategory)
        }
    }
}
