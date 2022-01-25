//
//  GravityToggleStyle.swift
//  
//
//  Created by Djuro on 1/11/22.
//

import SwiftUI

/// A `ToggleStyle` with a gravity-inspired animation when toggled.
/// The toggle is tinted with both `primaryColor` and `secondaryColor`
/// - Parameter onLabel: String displayed next to the "on" side. Default: "On"
/// - Parameter offLabel: String displayed next to the "off" side. Default: "Off"
public struct GravityToggleStyle: ToggleStyle {
    
    // MARK: - Properties
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.shadowColor) var shadowColor: Color
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    private let onLabel: String
    private let offLabel: String
    
    // MARK: - Initializer
    public init(onLabel: String = "ON", offLabel: String = "OFF") {
        self.onLabel = onLabel
        self.offLabel = offLabel
    }
    
    // MARK: - ToggleStyle
    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(offLabel)
                .fontWeight(.bold)
                .foregroundColor(primaryColor.tintOrShade(for: colorScheme, isEnabled: !configuration.isOn))
            
            ZStack {
                Capsule()
                    .fill(primaryColor)
                
                Circle()
                    .fill(secondaryColor)
                    .padding(4)
                    .shadow(color: shadowColor, radius: 10, x: 7, y: 7)
                    .offset(x: configuration.isOn ? 15 : -15)
                    .animation(.spring(), value: configuration.isOn)
            }
            .frame(width: 61, height: 31)
            .rotationEffect(Angle(degrees: configuration.isOn ? 10 : 0))
            .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.2), value: configuration.isOn)
            .onTapGesture {
                configuration.isOn.toggle()
            }
            
            Text(onLabel)
                .fontWeight(.bold)
                .foregroundColor(primaryColor.tintOrShade(for: colorScheme, isEnabled: configuration.isOn))
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ToggleStyle where Self == GravityToggleStyle {

    /// A `ToggleStyle` with a gravity-inspired animation when toggled.
    /// The toggle is tinted with both `primaryColor` and `secondaryColor`
    public static var gravity: GravityToggleStyle {
        GravityToggleStyle()
    }

    /// A `ToggleStyle` with a gravity-inspired animation when toggled.
    /// The toggle is tinted with both `primaryColor` and `secondaryColor`
    /// - Parameter onLabel: String displayed next to the "on" side
    /// - Parameter offLabel: String displayed next to the "off" side
    public static func gravity(onLabel: String, offLabel: String) -> GravityToggleStyle {
        GravityToggleStyle(onLabel: onLabel, offLabel: offLabel)
    }
}
