//
//  Helpers.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

extension Color {
    init(hex: UInt32) {
        self.init(red: CGFloat(Double(hex >> 16) / 255.0),
                  green: CGFloat(Double(hex >> 8 & 0xff) / 255.0),
                  blue: CGFloat(Double(hex & 0x000000ff) / 255.0))
    }
}
