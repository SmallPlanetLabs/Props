//
//  PreviewDeviceName.swift
//  Props
//
//  Created by Quinn McHenry on 11/18/21.
//

import SwiftUI

/// Enumeration of devices available to ``PreviewMultiple``
///
/// The names of these devices can be updated by running:
/// `xcrun simctl list devicetypes | rev | cut -d\( -f2- | rev`
/// Devices before the iPhone 6s cannot run SwiftUI and are excluded
public enum PreviewDeviceName {
    case iPhopne6s
    case iPhone6sPlus
    case iPhoneSE1
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXs
    case iPhoneXSMax
    case iPhoneXR
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSE2
    case iPhone12Mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Pro
    case iPhone13ProMax
    case iPhone13Mini
    case iPhone13
    case iPodTouch7
    case iPadMini4
    case iPadAir2
    case iPadPro9_7
    case iPadPro12_9_1st
    case iPad_5th
    case iPadPro12_9_2nd
    case iPadPro10_5
    case iPad_6th
    case iPad_7th
    case iPad11_1st
    case iPadPro12_9_3rd
    case iPad11_2nd
    case iPadPro12_9_4th
    case iPadMini_5th
    case iPadAir_3rd
    case iPad_8th
    case iPad_9th
    case iPadAir_4th
    case iPad11_3rd
    case iPad12_9_5th
    case iPadMini_6th
    case tv
    case tv4K
    case tv4K_1080p
    case tv4K_2nd
    case tv4K_1080p_2nd
    case watch2_38mm
    case watch2_42mm
    case watch3_38mm
    case watch3_42mm
    case watch4_40mm
    case watch4_44mm
    case watch5_40mm
    case watch5_44mm
    case watchSE_40mm
    case watchSE_44mm
    case watch6_40mm
    case watch6_44mm
    case watch7_41mm
    case watch7_45mm

    var name: String {
        switch self {
        case .iPhopne6s: return "iPhone 6s"
        case .iPhone6sPlus: return "iPhone 6s Plus"
        case .iPhoneSE1: return "iPhone SE (1st generation)"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXs: return "iPhone Xs"
        case .iPhoneXSMax: return "iPhone Xs Max"
        case .iPhoneXR: return "iPhone Xʀ"
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhoneSE2: return "iPhone SE (2nd generation)"
        case .iPhone12Mini: return "iPhone 12 mini"
        case .iPhone12: return "iPhone 12"
        case .iPhone12Pro: return "iPhone 12 Pro"
        case .iPhone12ProMax: return "iPhone 12 Pro Max"
        case .iPhone13Pro: return "iPhone 13 Pro"
        case .iPhone13ProMax: return "iPhone 13 Pro Max"
        case .iPhone13Mini: return "iPhone 13 mini"
        case .iPhone13: return "iPhone 13"
        case .iPodTouch7: return "iPod touch (7th generation)"
        case .iPadMini4: return "iPad mini 4"
        case .iPadAir2: return "iPad Air 2"
        case .iPadPro9_7: return "iPad Pro (9.7-inch)"
        case .iPadPro12_9_1st: return "iPad Pro (12.9-inch) (1st generation)"
        case .iPad_5th: return "iPad (5th generation)"
        case .iPadPro12_9_2nd: return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPadPro10_5: return "iPad Pro (10.5-inch)"
        case .iPad_6th: return "iPad (6th generation)"
        case .iPad_7th: return "iPad (7th generation)"
        case .iPad11_1st: return "iPad Pro (11-inch) (1st generation)"
        case .iPadPro12_9_3rd: return "iPad Pro (12.9-inch) (3rd generation)"
        case .iPad11_2nd: return "iPad Pro (11-inch) (2nd generation)"
        case .iPadPro12_9_4th: return "iPad Pro (12.9-inch) (4th generation)"
        case .iPadMini_5th: return "iPad mini (5th generation)"
        case .iPadAir_3rd: return "iPad Air (3rd generation)"
        case .iPad_8th: return "iPad (8th generation)"
        case .iPad_9th: return "iPad (9th generation)"
        case .iPadAir_4th: return "iPad Air (4th generation)"
        case .iPad11_3rd: return "iPad Pro (11-inch) (3rd generation)"
        case .iPad12_9_5th: return "iPad Pro (12.9-inch) (5th generation)"
        case .iPadMini_6th: return "iPad mini (6th generation)"
        case .tv: return "Apple TV"
        case .tv4K: return "Apple TV 4K"
        case .tv4K_1080p: return "Apple TV 4K (at 1080p)"
        case .tv4K_2nd: return "Apple TV 4K (2nd generation)"
        case .tv4K_1080p_2nd: return "Apple TV 4K (at 1080p) (2nd generation)"
        case .watch2_38mm: return "Apple Watch Series 2 - 38mm"
        case .watch2_42mm: return "Apple Watch Series 2 - 42mm"
        case .watch3_38mm: return "Apple Watch Series 3 - 38mm"
        case .watch3_42mm: return "Apple Watch Series 3 - 42mm"
        case .watch4_40mm: return "Apple Watch Series 4 - 40mm"
        case .watch4_44mm: return "Apple Watch Series 4 - 44mm"
        case .watch5_40mm: return "Apple Watch Series 5 - 40mm"
        case .watch5_44mm: return "Apple Watch Series 5 - 44mm"
        case .watchSE_40mm: return "Apple Watch SE - 40mm"
        case .watchSE_44mm: return "Apple Watch SE - 44mm"
        case .watch6_40mm: return "Apple Watch Series 6 - 40mm"
        case .watch6_44mm: return "Apple Watch Series 6 - 44mm"
        case .watch7_41mm: return "Apple Watch Series 7 - 41mm"
        case .watch7_45mm: return "Apple Watch Series 7 - 45mm"
        }
    }
}
