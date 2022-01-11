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
    private let onLabel: String
    private let offLabel: String
    
    // MARK: - Initializer
    public init(onLabel: String = "ON", offLabel: String = "OFF") {
        self.onLabel = onLabel
        self.offLabel = offLabel
    }
    
    // MARK: - ToggleStyle
    public func makeBody(configuration: Self.Configuration) -> some View {
        GeometryReader { geometry in
            let offset = geometry.size.width/2 - 3 * geometry.size.height/2 + 10
            
            HStack {
                Text(offLabel)
                    .fontWeight(.bold)
                    .foregroundColor(configuration.isOn ? .gray : .black)
                
                ZStack {
                    Capsule()
                        .fill(primaryColor)
                    
                    Circle()
                        .fill(.white)
                        .padding(4)
                        .shadow(color: Color.black.opacity(0.4),
                                radius: 10.0,
                                x: 7.0,
                                y: 7.0)
                        .offset(x: configuration.isOn ? offset : -offset)
                        .animation(.spring(), value: configuration.isOn)
                        .onTapGesture {
                            configuration.isOn.toggle()
                        }
                }
                .rotationEffect(Angle(degrees: configuration.isOn ? 10 : 0))
                .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.2), value: configuration.isOn)
                
                Text(onLabel)
                    .fontWeight(.bold)
                    .foregroundColor(configuration.isOn ? .black : .gray)
            }
        }
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
