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

extension EnvironmentValues {
    public var primaryColor: Color {
        get { self[PrimaryColorKey.self] }
        set { self[PrimaryColorKey.self] = newValue }
    }

    public var secondaryColor: Color {
        get { self[SecondaryColorKey.self] }
        set { self[SecondaryColorKey.self] = newValue }
    }
}

extension View {
    public func primaryColor(_ color: Color) -> some View {
        environment(\.primaryColor, color)
    }

    public func secondaryColor(_ color: Color) -> some View {
        environment(\.primaryColor, color)
    }
}
