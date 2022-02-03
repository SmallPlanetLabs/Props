//
//  File.swift
//  
//
//  Created by Djuro on 12/10/21.
//

import SwiftUI

/// An outlined `ButtonStyle` with a hand drawn appearance
///
/// - Parameter shape: determines which shape style to use. Default: `shape1`.
///
/// Using different `shape` styles will give a more natural, hand-drawn appearance by avoiding repetition.
/// Uses `primaryColor`.

public struct HandwrittenButtonStyle: ButtonStyle, Enableable {
    
    public enum ShapeType: String {
        case shape1 = "shape-1"
        case shape2 = "shape-2"
        case shape3 = "shape-3"
    }
    
    // MARK: - Properties
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.primaryColor) var primaryColor: Color
    let shape: ShapeType
    
    // MARK: - Public API
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("ChalkboardSE-Light", fixedSize: 16))
            .padding()
            .background(
                Image(shape.rawValue, bundle: .module)
                    .resizable()
            )
            .foregroundColor(primaryColor.opacity(isEnabled ? 1 : 0.5))
    }

    // MARK: - Initializer
    public init(shape: ShapeType = .shape1) {
        self.shape = shape
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ButtonStyle where Self == HandwrittenButtonStyle {

    /// An outlined `ButtonStyle` with a hand drawn appearance.
    public static var handwritten: HandwrittenButtonStyle {
        HandwrittenButtonStyle()
    }

    /// An outlined `ButtonStyle` with a hand drawn appearance.
    /// - Parameter shape: determines which shape style to use. Default: `shape1`.
    public static func handwritten(shape: HandwrittenButtonStyle.ShapeType) -> HandwrittenButtonStyle {
        HandwrittenButtonStyle(shape: shape)
    }

}
