//
//  File.swift
//  
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

public struct FilledButton: ButtonStyle, Enableable, PrimaryColorable, ColorSchemable  {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.colorScheme) var scheme: ColorScheme
    let cornerRadius: CGFloat
    
    public func makeBody(configuration: Configuration) -> some View {
        let background = RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundColor(for: configuration))
        
        configuration.label
            .foregroundColor(secondaryColor)
            .padding()
            .background(background)
    }
    
    public init(cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
}
