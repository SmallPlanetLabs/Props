//
//  RolloverToggleStyle.swift
//  
//
//  Created by Djuro on 1/13/22.
//

import SwiftUI

/// A `ToggleStyle` with a rollover-inspired animation when toggled.
/// The toggle is tinted with both `primaryColor` and `secondaryColor`
/// - Parameter onLabel: String displayed next to the "on" side. Default: "Night"
/// - Parameter offLabel: String displayed next to the "off" side. Default: "Day"
public struct RolloverToggleStyle: ToggleStyle {
    
    // MARK: - Properties
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    @Environment(\.shadowColor) var shadowColor: Color
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    private let onLabel: String
    private let offLabel: String
    private let height = CGFloat(31)
    
    // MARK: - Initializer
    public init(onLabel: String = "NIGHT", offLabel: String = "DAY") {
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
//                    .fill(primaryColor)
                
                Circle()
                    .fill(secondaryColor)
                    .padding(4)
                    .overlay(
                        Image(systemName: "globe.europe.africa.fill")
                            .resizable()
                            .frame(width: height - 4, height: height - 4)
                            .foregroundColor(configuration.isOn ? primaryColor : Color.blue)
                    )
                    .shadow(color: shadowColor, radius: 3, x: 1, y: 1)
                    .rotationEffect(.degrees(configuration.isOn ? 0 : -360))
                    .offset(x: (configuration.isOn ? 0.5 : -0.5) * (height - 2))
                    .animation(.easeIn, value: configuration.isOn)
            }
            .frame(width: 61, height: height)
            .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.2), value: configuration.isOn)
            .offset(x: configuration.isOn ? 3 : -3)
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
extension ToggleStyle where Self == RolloverToggleStyle {
    
    /// A `ToggleStyle` with a rollover-inspired animation when toggled.
    /// The toggle is tinted with both `primaryColor` and `secondaryColor`
    public static var rollover: RolloverToggleStyle {
        RolloverToggleStyle()
    }
    
    /// A `ToggleStyle` with a rollover-inspired animation when toggled.
    /// The toggle is tinted with both `primaryColor` and `secondaryColor`
    /// - Parameter onLabel: String displayed next to the "on" side
    /// - Parameter offLabel: String displayed next to the "off" side
    public static func rollover(onLabel: String, offLabel: String) -> RolloverToggleStyle {
        RolloverToggleStyle(onLabel: onLabel, offLabel: offLabel)
    }
}
