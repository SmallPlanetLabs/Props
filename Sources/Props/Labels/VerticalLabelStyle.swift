//
//  VerticalLabelStyle.swift
//  
//
//  Created by Djuro on 1/4/22.
//

import SwiftUI

public struct VerticalLabelStyle: LabelStyle {
    
    // MARK: - Properties
    let spacing: CGFloat
    
    // MARK: - LabelStyle
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: spacing) {
            configuration.icon
            configuration.title
        }
    }
    
    // MARK: - Initializer
    public init(spacing: CGFloat = 8) {
        self.spacing = spacing
    }
}
