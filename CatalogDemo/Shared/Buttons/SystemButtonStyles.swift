//
//  SystemButtonStyles.swift
//  Catalog
//
//  Created by Quinn McHenry on 11/2/21.
//

import SwiftUI

struct SystemButtonStyles: View {
    var body: some View {
        VStack(spacing: 12) {
            EnabledAndDisabled(title: "DefaultButtonStyle") {
                Button("Button") {}.buttonStyle(DefaultButtonStyle())
            }
            
            if #available(iOS 15.0, *) {
                EnabledAndDisabled(title: "BorderedButtonStyle (iOS 15+)") {
                    Button("Button") {}.buttonStyle(BorderedButtonStyle())
                }
                
                EnabledAndDisabled(title: "BorderedProminentButtonStyle (iOS 15+") {
                    Button("Button") {}.buttonStyle(BorderedProminentButtonStyle())
                }
                .tint(.orange)
                
            }
            
            EnabledAndDisabled(title: "BorderlessButtonStyle") {
                Button("Button") {}.buttonStyle(BorderlessButtonStyle())
            }
            
            EnabledAndDisabled(title: "PlainButtonStyle") {
                Button("Button") {}.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct SystemButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        SystemButtonStyles()
            .padding()
    }
}
