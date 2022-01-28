//
//  PreviewDevice.swift
//  Props
//
//  Created by Quinn McHenry on 11/18/21.
//

import SwiftUI

public struct PreviewConfiguration {
    let deviceModel: PreviewDeviceName
    let colorScheme: ColorScheme
    let orientation: InterfaceOrientation
    let sizeCategory: ContentSizeCategory

    var name: String {
        "\(deviceModel.name) \(colorScheme) \(orientation) size category: \(sizeCategory)"
    }

    var device: SwiftUI.PreviewDevice {
        .init(rawValue: deviceModel.name)
    }

    public init(_ deviceName: PreviewDeviceName, scheme: ColorScheme = .light, orientation: InterfaceOrientation = .portrait, sizeCategory: ContentSizeCategory = .large) {
        self.deviceModel = deviceName
        self.colorScheme = scheme
        self.orientation = orientation
        self.sizeCategory = sizeCategory
    }
}
