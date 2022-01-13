//
//  RolloverToggleStyle.swift
//  
//
//  Created by Djuro on 1/13/22.
//

import SwiftUI

public struct RolloverToggleStyle: ToggleStyle {
    
    // MARK: - Properties
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
    private let onLabel: String
    private let offLabel: String
    
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
                .foregroundColor(configuration.isOn ? primaryColor.opacity(0.3) : primaryColor)
            
            ZStack {
                Capsule()
                    .fill(primaryColor)
                
                Circle()
                    .fill(secondaryColor)
                    .padding(4)
                    .overlay(
                        Image(systemName: "globe.europe.africa.fill")
                            .resizable()
                            .frame(width: 41, height: 41)
                            .foregroundColor(configuration.isOn ? Color.black : Color.blue)
                    )
                    .shadow(color: Color.black.opacity(0.4),
                            radius: 4.0,
                            x: 2.0,
                            y: 2.0)
                    .rotationEffect(.degrees(configuration.isOn ? 0 : -360))
                    .offset(x: configuration.isOn ? 33 : -33)
                    .animation(.easeIn, value: configuration.isOn)
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.2), value: configuration.isOn)
            .offset(x: configuration.isOn ? 3 : -3)
            .onTapGesture {
                configuration.isOn.toggle()
            }
            
            Text(onLabel)
                .fontWeight(.bold)
                .foregroundColor(configuration.isOn ? primaryColor : primaryColor.opacity(0.3))
        }
        .frame(width: 220, height: 50)
    }
}

struct RolloverToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Toggle("", isOn: .constant(true))
        }
        .toggleStyle(RolloverToggleStyle())
    }
}
