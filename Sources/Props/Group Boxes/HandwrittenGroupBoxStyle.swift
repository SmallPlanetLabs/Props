//
//  HandwrittenGroupBoxStyle.swift
//  
//
//  Created by Djuro on 12/30/21.
//

import SwiftUI

public struct HandwrittenGroupBoxStyle: GroupBoxStyle {
    
    public enum ShapeType: String {
        case shape1 = "shape-1"
        case shape2 = "shape-2"
        case shape3 = "shape-3"
    }
    
    let shape: ShapeType
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding()
            .background(
                Image(shape.rawValue, bundle: .module)
                    .resizable()
            )
            .opacity(0.4)
            .overlay(
                configuration.label
                    .font(Font.custom("ChalkboardSE-Light", fixedSize: 16))
                    .padding(.leading, 4),
                alignment: .topLeading
            )
    }
    
    // MARK: - Initializer
    public init(shape: ShapeType = .shape1) {
        self.shape = shape
    }
}
