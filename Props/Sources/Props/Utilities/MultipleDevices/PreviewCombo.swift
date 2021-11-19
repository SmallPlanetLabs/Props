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

    var name: String {
        "\(device.name) \(colorScheme) \(orientation)"
    }

    public init(device: PreviewDevice, scheme: ColorScheme = .light, orientation: InterfaceOrientation = .portrait) {
        self.device = device
        self.colorScheme = scheme
        self.orientation = orientation
    }
}
