//
//  PlainGroupBoxStyle.swift
//  
//
//  Created by Djuro on 12/30/21.
//

import SwiftUI

public struct PlainGroupBoxStyle: GroupBoxStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
    }
    
    // MARK: - Initializer
    public init() {}
}
