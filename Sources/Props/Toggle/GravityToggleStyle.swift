//
//  GravityToggleStyle.swift
//  
//
//  Created by Djuro on 1/11/22.
//

import SwiftUI

public struct GravityToggleStyle: ToggleStyle {
    
    // MARK: - Properties
    @Environment(\.primaryColor) var primaryColor: Color
    @Environment(\.secondaryColor) var secondaryColor: Color
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
                .foregroundColor(configuration.isOn ? primaryColor.opacity(0.3) : primaryColor)
            
            ZStack {
                Capsule()
                    .fill(primaryColor)
                
                Circle()
                    .fill(secondaryColor)
                    .padding(4)
                    .shadow(color: primaryColor.opacity(0.4),
                            radius: 10.0,
                            x: 7.0,
                            y: 7.0)
                    .offset(x: configuration.isOn ? 36 : -36)
                    .animation(.spring(), value: configuration.isOn)
            }
            .rotationEffect(Angle(degrees: configuration.isOn ? 10 : 0))
            .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.2), value: configuration.isOn)
            .onTapGesture {
                configuration.isOn.toggle()
            }
            
            Text(onLabel)
                .fontWeight(.bold)
                .foregroundColor(configuration.isOn ? primaryColor : primaryColor.opacity(0.3))
        }
        .frame(width: 200, height: 50)
    }
}

struct GravityToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Toggle("", isOn: .constant(true))
        }
        .toggleStyle(GravityToggleStyle())
    }
}
