//
//  MultipleDevices.swift
//  smallplanet.com
//
//  Created by Ryan Goodlett on 5/18/21.
//

import SwiftUI

// todo: OptionSet parameter for what devices to show with a .default option as below, potentially adding light/dark choices, too

/// Builds a Group of `Content` on `iPhone 13 Pro Max`,
/// `iPhone 8`, `iPhone 8`,
/// and `iPod touch (7th generation)`.
public struct MultipleDevices<Content: View>: View {
    let combos: [PreviewCombo]
    let content: Content

    public init(combos: MultipleDeviceCombo = .defaults, @ViewBuilder content: () -> Content) {
        self.combos = combos
        self.content = content()
    }

    public var body: some View {
        ForEach(combos, id: \.name) { combo in
            content
                .previewDevice(SwiftUI.PreviewDevice(rawValue: combo.device.name))
                .previewDisplayName(combo.name)
                .colorScheme(combo.colorScheme)
                // .previewInterfaceOrientation(combo.orientation)
        }
    }
}

public struct PreviewCombo {
    let device: PreviewDevice
    let colorScheme: ColorScheme
    // let orientation: InterfaceOrientation

    var name: String {
        "\(device.name) \(colorScheme)" //" \(orientation)"
    }

    public init(device: PreviewDevice, scheme: ColorScheme = .light) { // }, orientation: InterfaceOrientation = .portrait) {
        self.device = device
        self.colorScheme = scheme
        // self.orientation = orientation
    }
}

public typealias MultipleDeviceCombo = [PreviewCombo]

extension MultipleDeviceCombo {
    public static let defaults: [PreviewCombo] = [
        PreviewCombo(device: .iPhone13ProMax),
        PreviewCombo(device: .iPodTouch7),
    ]

    public static let iPhonesAndiPad: [PreviewCombo] = [
        PreviewCombo(device: .iPhone13ProMax, scheme: .dark),
        PreviewCombo(device: .iPadAir4),
        PreviewCombo(device: .iPodTouch7),
    ]

//    public static let iPhoneOrientations: [PreviewCombo] = [
//        PreviewCombo(device: .iPhone13ProMax),
//        PreviewCombo(device: .iPhone13ProMax, orientation: .landscapeLeft),
//        PreviewCombo(device: .iPhone13ProMax, orientation: .landscapeRight),
//        PreviewCombo(device: .iPhone13ProMax, orientation: .portraitUpsideDown),
//    ]
}

public enum PreviewDevice {
    case iPadAir4
    case iPhone13ProMax
    case iPhone8
    case iPodTouch7

    var name: String {
        switch self {
        case .iPadAir4:
            return "iPad Air (4th generation)"
        case .iPhone13ProMax:
            return "iPhone 13 Pro Max"
        case .iPhone8:
            return "iPhone 8"
        case .iPodTouch7:
            return "iPod touch (7th generation)"
        }
    }
}
