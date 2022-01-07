//
//  Environment.swift
//  
//
//  Created by Quinn McHenry on 11/9/21.
//

import SwiftUI

private struct PrimaryColorKey: EnvironmentKey {
    static let defaultValue = Color.black
}

private struct SecondaryColorKey: EnvironmentKey {
    static let defaultValue = Color.gray
}

private struct ShadowColorKey: EnvironmentKey {
    static let defaultValue = Color.gray.opacity(0.6)
}

extension EnvironmentValues {
    public var primaryColor: Color {
        get { self[PrimaryColorKey.self] }
        set { self[PrimaryColorKey.self] = newValue }
    }

    public var secondaryColor: Color {
        get { self[SecondaryColorKey.self] }
        set { self[SecondaryColorKey.self] = newValue }
    }
    
    public var shadowColor: Color {
        get { self[ShadowColorKey.self] }
        set { self[ShadowColorKey.self] = newValue }
    }
}

extension View {
    public func primaryColor(_ color: Color) -> some View {
        environment(\.primaryColor, color)
    }

    public func secondaryColor(_ color: Color) -> some View {
        environment(\.secondaryColor, color)
    }
    
    public func shadowColor(_ color: Color) -> some View {
        environment(\.shadowColor, color)
    }
}
