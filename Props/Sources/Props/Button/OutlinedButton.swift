//
//  File.swift
//  
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

public struct OutlinedButton: ButtonStyle, Enableable, PrimaryColorable, ColorSchemable {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.colorScheme) var scheme: ColorScheme
    let cornerRadius: CGFloat
    
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(backgroundColor(for: configuration))
        
        configuration
            .label
            .foregroundColor(backgroundColor(for: configuration))
            .padding()
            .background(background)
    }
    
    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}

extension ButtonStyle where Self == OutlinedButton {
    public static var outlined: OutlinedButton { OutlinedButton() }
}
