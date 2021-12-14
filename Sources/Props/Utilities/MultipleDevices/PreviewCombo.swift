//
//  PreviewCombo.swift
//  Props
//
//  Created by Quinn McHenry on 11/18/21.
//

import SwiftUI

public struct PreviewCombo {
    let device: PreviewDevice
    let colorScheme: ColorScheme
    let orientation: InterfaceOrientation
    let sizeCategory: ContentSizeCategory

    var name: String {
        "\(device.name) \(colorScheme) \(orientation) size category: \(sizeCategory)"
    }

    public init(device: PreviewDevice, scheme: ColorScheme = .light, orientation: InterfaceOrientation = .portrait, sizeCategory: ContentSizeCategory = .large) {
        self.device = device
        self.colorScheme = scheme
        self.orientation = orientation
        self.sizeCategory = sizeCategory
    }
}
