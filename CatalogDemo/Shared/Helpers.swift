//
//  Helpers.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Color {

    init(hex: UInt32) {
        self.init(red: CGFloat(Double(hex >> 16) / 255.0),
                  green: CGFloat(Double(hex >> 8 & 0xff) / 255.0),
                  blue: CGFloat(Double(hex & 0x000000ff) / 255.0))
    }

    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            return (0, 0, 0, 0)
        }

        return (red: r, green: g, blue: b, opacity: o)
    }

    func tinted(by amount: CGFloat) -> Color {
        func modify(_ rgbValue: CGFloat) -> CGFloat {
            rgbValue + amount * (1 - rgbValue)
        }
        let untinted = components
        let tinted = (red: modify(untinted.red), green: modify(untinted.green), blue: modify(untinted.blue), opacity: untinted.opacity)
        print("--")
        debugPrint(untinted)
        debugPrint(tinted)
        return Color(red: tinted.red, green: tinted.green, blue: tinted.blue, opacity: tinted.opacity)
    }

    func shaded(by amount: CGFloat) -> Color {
        func modify(_ rgbValue: CGFloat) -> CGFloat {
            amount * rgbValue
        }
        let components = components
        let shaded = (red: modify(components.red), green: modify(components.green), blue: modify(components.blue), opacity: components.opacity)
        return Color(red: shaded.red, green: shaded.green, blue: shaded.blue, opacity: shaded.opacity)
    }
}
