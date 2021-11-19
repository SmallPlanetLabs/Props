//
//  MultiplePreviewCombo.swift
//  Props
//
//  Created by Quinn McHenry on 11/18/21.
//

import SwiftUI

public typealias MultiplePreviewCombo = [PreviewCombo]

extension MultiplePreviewCombo {
    public static let defaults: MultiplePreviewCombo = [
        PreviewCombo(device: .iPhone13ProMax),
        PreviewCombo(device: .iPhone8),
        PreviewCombo(device: .iPodTouch7),
    ]

    public static let dark: MultiplePreviewCombo = [
        PreviewCombo(device: .iPhone13ProMax, scheme: .dark),
        PreviewCombo(device: .iPhone8, scheme: .dark),
        PreviewCombo(device: .iPodTouch7, scheme: .dark),
    ]

    public static let lightDark: MultiplePreviewCombo = [
        PreviewCombo(device: .iPhone13ProMax, scheme: .light),
        PreviewCombo(device: .iPhone13ProMax, scheme: .dark),
    ]

    public static let iPhonesAndiPad: MultiplePreviewCombo = [
        PreviewCombo(device: .iPhone13ProMax),
        PreviewCombo(device: .iPodTouch7),
        PreviewCombo(device: .iPadAir_4th),
    ]

    public static let iPhoneOrientations: MultiplePreviewCombo = [
        PreviewCombo(device: .iPhone13ProMax),
        PreviewCombo(device: .iPhone13ProMax, orientation: .landscapeLeft),
        PreviewCombo(device: .iPhone13ProMax, orientation: .landscapeRight),
        PreviewCombo(device: .iPhone13ProMax, orientation: .portraitUpsideDown),
    ]

    public static let iPadOrientations: MultiplePreviewCombo = [
        PreviewCombo(device: .iPadAir_4th, orientation: .portrait),
        PreviewCombo(device: .iPadAir_4th, orientation: .landscapeLeft),
    ]

    public static let watches: MultiplePreviewCombo = [
        PreviewCombo(device: .watch7_41mm),
        PreviewCombo(device: .watch7_45mm),
    ]
}