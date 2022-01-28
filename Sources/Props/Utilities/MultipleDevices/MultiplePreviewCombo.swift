//
//  PreviewCombination.swift
//  Props
//
//  Created by Quinn McHenry on 11/18/21.
//

import SwiftUI

public typealias PreviewCombination = [PreviewConfiguration]

extension PreviewCombination {
    public static let `default`: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax),
        PreviewConfiguration(.iPhone8),
        PreviewConfiguration(.iPodTouch7),
    ]

    public static let dark: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax, scheme: .dark),
        PreviewConfiguration(.iPhone8, scheme: .dark),
        PreviewConfiguration(.iPodTouch7, scheme: .dark),
    ]

    public static let lightDarkiPhoneBig: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax, scheme: .light),
        PreviewConfiguration(.iPhone13ProMax, scheme: .dark),
    ]

    public static let lightDarkiPhoneMedium: PreviewCombination = [
        PreviewConfiguration(.iPhone8, scheme: .light),
        PreviewConfiguration(.iPhone8, scheme: .dark),
    ]

    public static let lightDarkiPhoneSmall: PreviewCombination = [
        PreviewConfiguration(.iPhone13Mini, scheme: .light),
        PreviewConfiguration(.iPhone13Mini, scheme: .dark),
    ]

    public static let lightDarkiPhoneBigLandscape: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax, scheme: .light, orientation: .landscapeLeft),
        PreviewConfiguration(.iPhone13ProMax, scheme: .dark, orientation: .landscapeLeft),
    ]

    public static let lightDarkiPhoneMediumLandscape: PreviewCombination = [
        PreviewConfiguration(.iPhone8, scheme: .light, orientation: .landscapeLeft),
        PreviewConfiguration(.iPhone8, scheme: .dark, orientation: .landscapeLeft),
    ]

    public static let lightDarkiPhoneSmallLandscape: PreviewCombination = [
        PreviewConfiguration(.iPhone13Mini, scheme: .light, orientation: .landscapeLeft),
        PreviewConfiguration(.iPhone13Mini, scheme: .dark, orientation: .landscapeLeft),
    ]

    public static let iPhonesAndiPad: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax),
        PreviewConfiguration(.iPodTouch7),
        PreviewConfiguration(.iPadAir_4th),
    ]

    public static let iPhoneOrientations: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax),
        PreviewConfiguration(.iPhone13ProMax, orientation: .landscapeLeft),
        PreviewConfiguration(.iPhone13ProMax, orientation: .landscapeRight),
        PreviewConfiguration(.iPhone13ProMax, orientation: .portraitUpsideDown),
    ]

    public static let iPadOrientations: PreviewCombination = [
        PreviewConfiguration(.iPadAir_4th, orientation: .portrait),
        PreviewConfiguration(.iPadAir_4th, orientation: .landscapeLeft),
    ]

    public static let watches: PreviewCombination = [
        PreviewConfiguration(.watch7_41mm),
        PreviewConfiguration(.watch7_45mm),
    ]

    public static let iPhone13ProMaxSizeCategories: PreviewCombination = [
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .extraSmall),
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .large),
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .extraLarge),
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .extraExtraExtraLarge),
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .accessibilityMedium),
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .accessibilityExtraLarge),
        PreviewConfiguration(.iPhone13ProMax, sizeCategory: .accessibilityExtraExtraExtraLarge),
    ]
}
