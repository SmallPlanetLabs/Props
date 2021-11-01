//
//  SpaceForm.swift
//  Forms
//
//  Created by Quinn McHenry on 11/1/21.
//

import SwiftUI

struct SpaceForm: View {
    var body: some View {
        let gradient: LinearGradient = LinearGradient(colors: [Color("BrandGradientStart"), Color("BrandGradientEnd")], startPoint: .topLeading, endPoint: .bottomTrailing)

        VStack(spacing: 40) {
            // Persistent header
            HStack {
                Text("Branding").font(.title)
                Spacer()
            }

            Text("Forms ... in ... SPACE! 🚀")
            Text("Forms ... in ... SPACE! 🚀")
            Text("🚀")
            Text("Forms ... in ... SPACE! 🚀")
            Spacer()
        }
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
        .background(gradient)
    }
}

struct SpaceForm_Previews: PreviewProvider {
    static var previews: some View {
        SpaceForm()
    }
}
