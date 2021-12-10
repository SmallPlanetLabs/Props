//
//  File.swift
//  
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

public struct HandwrittenButtonStyle: ButtonStyle, Enableable, ColorSchemable {
    
    public enum ShapeType: String {
        case shape1 = "shape-1"
        case shape2 = "shape-2"
        case shape3 = "shape-3"
    }
    
    // MARK: - Properties
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.colorScheme) var scheme: ColorScheme
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.shadowColor) var shadowColor: Color
    let shape: ShapeType
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("ChalkboardSE-Light", fixedSize: 16))
            .padding()
            .background(
                Image(shape.rawValue, bundle: .module)
                    .resizable()
                    .foregroundColor(secondaryColor)
            )
            .shadow(color: isEnabled ? shadowColor : .clear, radius: 4, x: 5, y: 5)
    }
    
    // MARK: - Initializer
    public init(shape: ShapeType = .shape1) {
        self.shape = shape
    }
    
}
