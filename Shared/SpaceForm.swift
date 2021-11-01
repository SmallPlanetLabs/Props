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

        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    Spacer(minLength: 60)
                    Text("Name")
                    Text("Age")
                    Text("Role")
                    Text("About")
                    Text("Interests")
                    Text("Planet/Solar system/galaxy")
                    Text("Open to travel")
                    Text("Language")

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
            }
            // Persistent header
            HStack {
                Text("Branding").font(.title)
                Spacer()
            }
            .frame(height: 60)
        }
        .edgesIgnoringSafeArea(.all)
        .background(gradient)
    }
}

struct SpaceForm_Previews: PreviewProvider {
    static var previews: some View {
        SpaceForm()
    }
}
